## 以下、複数コンテナをワンライナーで起動し、WordPressが動作することを確認してください<br> wordpress:latest, mysql:5.7

### 0. docker composeとは？

Docker Composeは、複数のDockerコンテナを定義し、一度に実行するためのツールです。YAMLファイルを使用して、Dockerコンテナの起動や設定を行うことができます。<br>
公式ドキュメントは[こちら](https://docs.docker.com/compose/)

Docker Composeをインストールしていない人は、上記のドキュメントを見ながらインストールしてください。

### 1. docker-compose.ymlの記載

ググればいろいろな人がYAMLファイルを解説してますが、公式の案内としては、以下らへん。
[Docker Compose の概要](https://docs.docker.com/compose/)
[github-Compose file](https://github.com/compose-spec/compose-spec/blob/master/spec.md#compose-file)

<details><summary>（例）ファイルの中身</summary><div>
  
```console
version: '3'

services:
   db:
     image: mysql:5.7
     volumes:
       - db_data:/var/lib/mysql
     restart: always
     environment:
       MYSQL_ROOT_PASSWORD: 1234
       MYSQL_DATABASE: wordpress
       MYSQL_USER: wordpress
       MYSQL_PASSWORD: wordpress

   wordpress:
     depends_on:
       - db
     image: wordpress:latest
     ports:
       - "8000:80"
     restart: always
     environment:
       WORDPRESS_DB_HOST: db:3306
       WORDPRESS_DB_USER: wordpress
       WORDPRESS_DB_PASSWORD: wordpress
volumes:
    db_data:
```
</div></details>

### 2. docker-compose.ymlの起動

起動して、コンテナ一覧を確認
```console
ubuntu@public-instance-tokunaga-ubuntu2:~/3_docker$ sudo docker compose up -d
[+] Running 2/4
 ⠇ Network 3_docker_default        Created                                                                                                                                                              0.8s 
 ⠇ Volume "3_docker_db_data"       Created                                                                                                                                                              0.7s 
 ✔ Container 3_docker-db-1         Started                                                                                                                                                              0.3s 
 ✔ Container 3_docker-wordpress-1  Started
                                                                                                                                              0.7s 
ubuntu@public-instance-tokunaga-ubuntu2:~/3_docker$ sudo docker container ls
CONTAINER ID   IMAGE              COMMAND                  CREATED             STATUS             PORTS                                   NAMES
d03ffa449f29   wordpress:latest   "docker-entrypoint.s…"   15 seconds ago      Up 14 seconds      0.0.0.0:8000->80/tcp, :::8000->80/tcp   3_docker-wordpress-1
1337a315e9cf   mysql:5.7          "docker-entrypoint.s…"   15 seconds ago      Up 14 seconds      3306/tcp, 33060/tcp                     3_docker-db-1
1709ef85a466   mysql:latest       "docker-entrypoint.s…"   About an hour ago   Up About an hour   3306/tcp, 33060/tcp
```

### 3. wordpressにアクセス
OCIコンソールからセキュリティリストのイングレスルールに宛先ポート8000を追加する<br>
`http://MACHINE_VM_IP:8000`　でアクセス可能
<br>
<img width="391" alt="スクリーンショット 2024-02-22 142310" src="https://github.com/sh-sho/cn_study_tutor_repository/assets/140580748/b5e437c2-d187-4a8f-924b-b6b1e529086a">





## 参考ドキュメント
[クィックスタート: Compose と WordPress](https://docs.docker.jp/compose/wordpress.html)　<br>
[Docker Compose の概要](https://docs.docker.com/compose/)
[github-Compose file](https://github.com/compose-spec/compose-spec/blob/master/spec.md#compose-file)
