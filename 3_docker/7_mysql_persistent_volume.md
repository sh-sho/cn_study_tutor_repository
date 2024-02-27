## mysql:5.7をデータを永続化させるようにして動かしてください

### 0.永続化の方法は複数あります。

公式ドキュメントは[こちら](https://docs.docker.com/storage/)

選択肢は `ボリューム`・`バインドマウント`・`tmpfs マウント`とありますが、推奨されているの`ボリューム`になります。

### 1.ボリュームで永続化する。

ボリュームを作成する
```console
ubuntu@public-instance-tokunaga-ubuntu2:~$ sudo docker volume create test-vol
test-vol
```

作成したボリュームを一覧表示
```console
ubuntu@public-instance-tokunaga-ubuntu2:~$ sudo docker volume ls
DRIVER    VOLUME NAME
local     test-vol
```

### 2.mySQLをpullする
```console
ubuntu@public-instance-tokunaga-ubuntu2:~/3_docker$ sudo docker pull mysql:5.7
5.7: Pulling from library/mysql
20e4dcae4c69: Pull complete 
1c56c3d4ce74: Pull complete 
e9f03a1c24ce: Pull complete 
68c3898c2015: Pull complete 
6b95a940e7b6: Pull complete 
90986bb8de6e: Pull complete 
ae71319cb779: Pull complete 
ffc89e9dfd88: Pull complete 
43d05e938198: Pull complete 
064b2d298fba: Pull complete 
df9a4d85569b: Pull complete 
Digest: sha256:4bc6bc963e6d8443453676cae56536f4b8156d78bae03c0145cbe47c2aad73bb
Status: Downloaded newer image for mysql:5.7
docker.io/library/mysql:5.7
```

### 3.ボリュームを使用してコンテナーを起動

ボリュームを指定して、コンテナを起動する
```console
ubuntu@public-instance-tokunaga-ubuntu2:~/3_docker$ sudo docker container run --name toku-mysql -v test-vol:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=1234 -d mysql:5.7
21aa9cac46e4a7dc5545a946395f497c322adfe72a82c186a840c0b25a8362fe
```

起動確認
```console
ubuntu@public-instance-tokunaga-ubuntu2:~$ sudo docker container ls
CONTAINER ID   IMAGE          COMMAND                  CREATED              STATUS              PORTS                 NAMES
21aa9cac46e4   mysql:5.7      "docker-entrypoint.s…"   About a minute ago   Up About a minute   3306/tcp, 33060/tcp   toku-mysql
```

MySQLにログイン
```console
ubuntu@public-instance-tokunaga-ubuntu2:~$ sudo docker exec -it toku-mysql bash
bash-4.4# mysql -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.3.0 MySQL Community Server - GPL

Copyright (c) 2000, 2024, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql>
```
testdbというデータベースを作成し、適当な値を入れたテーブルを作成する
```console
mysql> create database testdb;
Query OK, 1 row affected (0.01 sec)

mysql> use testdb;
Database changed

mysql> create table testdb(id int,name varchar(10));
Query OK, 0 rows affected (0.02 sec)

mysql> insert into testdb(id,name) values (0,'testname');
Query OK, 1 row affected (0.01 sec)

mysql> select * from testdb;
+------+----------+
| id   | name     |
+------+----------+
|    0 | testname |
+------+----------+
1 row in set (0.00 sec)

mysql> exit
Bye
bash-4.4# exit
exit

```
### 4.コンテナを破棄

```console
buntu@public-instance-tokunaga-ubuntu2:~$ sudo docker container ls
CONTAINER ID   IMAGE          COMMAND                  CREATED             STATUS             PORTS                 NAMES
21aa9cac46e4   mysql:5.7      "docker-entrypoint.s…"   About an hour ago   Up About an hour   3306/tcp, 33060/tcp   toku-mysql

ubuntu@public-instance-tokunaga-ubuntu2:~$ sudo docker container stop 21aa9cac46e4
21aa9cac46e4

ubuntu@public-instance-tokunaga-ubuntu2:~$ sudo docker container ls
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```

### 5.同じボリュームを指定して別名のコンテナを起動
今回は別名のコンテナ（toku-mysql2）を指定

```console
ubuntu@public-instance-tokunaga-ubuntu2:~$ sudo docker volume ls
DRIVER    VOLUME NAME
local     test-vol

ubuntu@public-instance-tokunaga-ubuntu2:~$ sudo docker container run --name toku-mysql2 -v test-vol:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=1234 -d mysql:5.7
d2ca375d6351750e330d77ef550c120d11aa6cce99d86d405630b495be7554d3

ubuntu@public-instance-tokunaga-ubuntu2:~$ sudo docker container ls
CONTAINER ID   IMAGE          COMMAND                  CREATED          STATUS          PORTS                 NAMES
d2ca375d6351   mysql:5.7      "docker-entrypoint.s…"   15 seconds ago   Up 14 seconds   3306/tcp, 33060/tcp   toku-mysql2
```

### 6.MySQLにログインし、先ほど作成したデータがあることを確認

```console
ubuntu@public-instance-tokunaga-ubuntu2:~$  sudo docker exec -it toku-mysql2 bash
bash-4.4# mysql -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.3.0 MySQL Community Server - GPL

Copyright (c) 2000, 2024, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> use testdb;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> show tables;
+------------------+
| Tables_in_testdb |
+------------------+
| testdb           |
+------------------+
1 row in set (0.00 sec)

mysql> select * from testdb;
+------+----------+
| id   | name     |
+------+----------+
|    0 | testname |
+------+----------+
1 row in set (0.00 sec)

mysql>
```

## 参考ドキュメント
[Docker でデータを管理する](https://docs.docker.com/storage/)
