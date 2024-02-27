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
ubuntu@public-instance-tokunaga-ubuntu2:~$ sudo docker pull mysql:latest
latest: Pulling from library/mysql
81badc5f380f: Pull complete 
c490e5dd1a9d: Pull complete 
87aeb61f1478: Pull complete 
1cacbea6ceda: Pull complete 
1e72891ace67: Pull complete 
42b720363d36: Pull complete 
6b3b50f9990a: Pull complete 
3811d52cfa61: Pull complete 
05bc7a0277d8: Pull complete 
cc0abd25a274: Pull complete 
Digest: sha256:ff5ab9cdce0b4c59704b4e2a09deed5ab8467be795e0ea20228b8528f53fcf82
Status: Downloaded newer image for mysql:latest
docker.io/library/mysql:latest
```

### 3.ボリュームを使用してコンテナーを起動

ボリュームを指定して、コンテナを起動する
```console
ubuntu@public-instance-tokunaga-ubuntu2:~$ sudo docker container run --name toku-mysql -v test-vol:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=1234 -d mysql:latest
7b0474846d56c3e344b15b2b94264284fae8949510f2164c1e8e1e6eb945427c
```

起動確認
```console
ubuntu@public-instance-tokunaga-ubuntu2:~$ sudo docker container ls
CONTAINER ID   IMAGE          COMMAND                  CREATED              STATUS              PORTS                 NAMES
7b0474846d56   mysql:latest   "docker-entrypoint.s…"   About a minute ago   Up About a minute   3306/tcp, 33060/tcp   toku-mysql
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
7b0474846d56   mysql:latest   "docker-entrypoint.s…"   About an hour ago   Up About an hour   3306/tcp, 33060/tcp   toku-mysql

ubuntu@public-instance-tokunaga-ubuntu2:~$ sudo docker container stop 7b0474846d56
7b0474846d56

ubuntu@public-instance-tokunaga-ubuntu2:~$ sudo docker container ls
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```

### 5.同じボリュームを指定して別名のコンテナを起動
今回は別名のコンテナ（toku-mysql2）を指定

```console
ubuntu@public-instance-tokunaga-ubuntu2:~$ sudo docker volume ls
DRIVER    VOLUME NAME
local     test-vol

ubuntu@public-instance-tokunaga-ubuntu2:~$ sudo docker container run --name toku-mysql2 -v test-vol:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=1234 -d mysql:latest1709ef85a46617ff7f6ba3e1bd7e3988ca65d69797f2600f19d8714a12b0581f

ubuntu@public-instance-tokunaga-ubuntu2:~$ sudo docker container ls
CONTAINER ID   IMAGE          COMMAND                  CREATED          STATUS          PORTS                 NAMES
1709ef85a466   mysql:latest   "docker-entrypoint.s…"   15 seconds ago   Up 14 seconds   3306/tcp, 33060/tcp   toku-mysql2
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
