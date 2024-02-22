## 作業用VMにダウンロード済みのコンテナイメージの一覧を出力してください

`docker image ls`コマンドでイメージの一覧を出力

```console
ubuntu@public-instance-tokunaga-ubuntu2:~$ sudo docker image ls
REPOSITORY                              TAG       IMAGE ID       CREATED        SIZE
nginx                                   latest    247f7abff9f7   3 months ago   187MB
hello-world                             latest    d2c94e258dcb   9 months ago   13.3kB
```

## 参考（公式ドキュメントのリンク）
[docker image ls](https://docs.docker.com/engine/reference/commandline/image_ls/)
