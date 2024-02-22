## ダウンロードしたnginx:latestのイメージ名をnrt.ocir.io/orasejapan/…/my-nginx:1.0.0に修正してください 

e.g. nrt.ocir.io/orasejapan/shukawam/my-nginx:1.0.0

tag変更したいIMAGE IDを確認する

```console
ubuntu@public-instance-tokunaga-ubuntu2:~$ sudo docker image ls
REPOSITORY    TAG       IMAGE ID       CREATED        SIZE
nginx         latest    247f7abff9f7   3 months ago   187MB
```

tag名を指定
```console
ubuntu@public-instance-tokunaga-ubuntu2:~$ sudo docker image tag 247f7abff9f7 iad.ocir.io/orasejapan/tokunaga/nginx:1.0.0
```

イメージ一覧を出し、変更されているか確認する。
```console
ubuntu@public-instance-tokunaga-ubuntu2:~$ sudo docker image ls
REPOSITORY                              TAG       IMAGE ID       CREATED        SIZE
nginx                                   latest    247f7abff9f7   3 months ago   187MB
iad.ocir.io/orasejapan/tokunaga/nginx   1.0.0     247f7abff9f7   3 months ago   187MB

```

## 参考（公式ドキュメントのリンク）
[docker image tag](https://docs.docker.com/engine/reference/commandline/image_tag/)
