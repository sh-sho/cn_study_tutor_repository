# #3 Dockerの基礎

※リージョンはどこでも構いません。

1. nginx:latestを作業用のVMにダウンロードしてください
2. 作業用VMにダウンロード済みのコンテナイメージの一覧を出力してください
3. ダウンロードしたnginx:latestのイメージ名をnrt.ocir.io/orasejapan/…/my-nginx:1.0.0に修正してください
e.g. nrt.ocir.io/orasejapan/shukawam/my-nginx:1.0.0
4. nrt.ocir.io/orasejapan/…/my-nginx:1.0.0をOCIRにpushしてください
5. nrt.ocir.io/orasejapan/…/my-nginx:1.0.0を動かし、デフォルトのHTMLを表示させてください
6. nrt.ocir.io/orasejapan/…/my-nginx:1.0.0を動かし、自分で作成した任意のHTMLを表示させてください
7. mysql:5.7をデータを永続化させるようにして動かしてください
8. 以下、複数コンテナをワンライナーで起動し、WordPressが動作することを確認してください<br>
    wordpress:latest, mysql:5.7
9. 以下、複数コンテナをContainer Instancesで起動し、WordPressが動作することを確認してください<br>
    wordpress:latest, mysql:5.7
