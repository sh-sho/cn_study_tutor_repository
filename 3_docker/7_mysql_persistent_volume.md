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

作成したボリュームを一覧表示する
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

```console
ubuntu@public-instance-tokunaga-ubuntu2:~$ sudo docker volume inspect test-vol
[
    {
        "CreatedAt": "2024-02-22T02:10:58Z",
        "Driver": "local",
        "Labels": null,
        "Mountpoint": "/var/lib/docker/volumes/test-vol/_data",
        "Name": "test-vol",
        "Options": null,
        "Scope": "local"
    }
]
```

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
