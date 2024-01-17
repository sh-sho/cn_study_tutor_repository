# 5.作成したバケットのみが出力に含まれるように実行オプションを変更し、その結果をファイルに出力してください（list-bucket-specify.json）

4では指定のコンパートメント内の全てのバケット一覧を取得してましたが、今回は出力するバケットを絞ります。<br>
オブジェクトストレージにはユーザ自身が作成したものもあれば、OCIが自動で作成したバケットも有ります。<br>
（例えば、OCMインスタンスを作成した際に、自動でできるバケット等）

### 1、--queryを使いバケット作成者を指定して、その一覧を標準出力する

<details><summary>（実行例）バケット作成者 (created-by) を指定した場合の標準出力</summary><div>

  
```console

ritsuko_to@cloudshell:~ (us-ashburn-1)$ oci os bucket list --compartment-id ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxx --namespace-name hoge_namespace --query 'data[?"created-by"==`ocid1.saml2idp.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxx/hoge.hoge@oracle.com`]'
[
  {
    "compartment-id": "ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxx",
    "created-by": "ocid1.saml2idp.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxx/hoge.hoge@oracle.com",
    "defined-tags": null,
    "etag": "d3913cf0-5f8d-45e7-81b3-cd99ebd0f215",
    "freeform-tags": null,
    "name": "test_bucket-20231101-2011_clone",
    "namespace": "hoge_namespace",
    "time-created": "2023-11-01T11:11:36.442000+00:00"
  }
]

```
</div></details>
<br>

### 2、--queryを使いバケット作成者を指定して、その一覧をファイル出力する

<details><summary>（実行例）バケット作成者 (created-by) を指定した場合のファイル出力</summary><div>

  
```console

ritsuko_to@cloudshell:~ (us-ashburn-1)$ oci os bucket list --compartment-id ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxx --namespace-name hoge_namespace --query 'data[?"created-by"==`ocid1.saml2idp.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxx/hoge.hoge@oracle.com`]' > list-bucket-specify.json

```
</div></details>
<br>
念のため、出力されたファイルをcatして確認します。
<details><summary>（実行例）catした結果</summary><div>

```console

ritsuko_to@cloudshell:~ (us-ashburn-1)$ cat list-bucket-specify.json 
[
  {
    "compartment-id": "ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxx",
    "created-by": "ocid1.saml2idp.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxx/hoge.hoge@oracle.com",
    "defined-tags": null,
    "etag": "d3913cf0-5f8d-45e7-81b3-cd99ebd0f215",
    "freeform-tags": null,
    "name": "test_bucket-20231101-2011_clone",
    "namespace": "hoge_namespace",
    "time-created": "2023-11-01T11:11:36.442000+00:00"
  }
]

```
</div></details>
