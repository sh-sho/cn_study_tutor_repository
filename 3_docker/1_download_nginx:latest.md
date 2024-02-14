# nginx:latestを作業用のVMにダウンロードしてください
<br>

## Dockerを作業用VMにインストールする
折角なので公式ドキュメントを見てみましょう。<br>
ubuntuの場合のページは　[https://docs.docker.com/engine/install/ubuntu/](こちら)です。
ドキュメントに沿って、インストールします。

インストール出来たら、`sudo docker version` でインストールの確認をします。

```console
ubuntu@public-instance-tokunaga-ubuntu2:~$ sudo docker version
Client: Docker Engine - Community
 Version:           25.0.3
 API version:       1.44
 Go version:        go1.21.6
 Git commit:        4debf41
 Built:             Tue Feb  6 21:14:17 2024
 OS/Arch:           linux/amd64
 Context:           default

Server: Docker Engine - Community
 Engine:
  Version:          25.0.3
  API version:      1.44 (minimum version 1.24)
  Go version:       go1.21.6
  Git commit:       f417435
  Built:            Tue Feb  6 21:14:17 2024
  OS/Arch:          linux/amd64
  Experimental:     false
 containerd:
  Version:          1.6.28
  GitCommit:        ae07eda36dd25f8a1b98dfbf587313b99c0190bb
 runc:
  Version:          1.1.12
  GitCommit:        v1.1.12-0-g51d5e94
 docker-init:
  Version:          0.19.0
  GitCommit:        de40ad0


```

## nginxをpullする

```console
ubuntu@public-instance-tokunaga-ubuntu2:~$ sudo systemctl start docker
```

```console
ubuntu@public-instance-tokunaga-ubuntu2:~$ sudo systemctl enable docker
Synchronizing state of docker.service with SysV service script with /lib/systemd/systemd-sysv-install.
Executing: /lib/systemd/systemd-sysv-install enable docker
```

```console
ubuntu@public-instance-tokunaga-ubuntu2:~$ sudo docker pull nginx
Using default tag: latest
latest: Pulling from library/nginx
e1caac4eb9d2: Pull complete 
504c1e01744e: Pull complete 
a1330b43d726: Pull complete 
5e8995dba715: Pull complete 
d5181593591e: Pull complete 
74a4f808141d: Pull complete 
330fd09f4306: Pull complete 
Digest: sha256:ac2b22fdbe4c13e6f3be8c5fe9a19677aa7614acaa1cbf5d354af723873cbd28
Status: Downloaded newer image for nginx:latest
docker.io/library/nginx:latest
```

```console
ubuntu@public-instance-tokunaga-ubuntu2:~$ sudo docker images
REPOSITORY    TAG       IMAGE ID       CREATED        SIZE
nginx         latest    247f7abff9f7   3 months ago   187MB
hello-world   latest    d2c94e258dcb   9 months ago   13.3kB
```
