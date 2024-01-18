# 5.３で作成したバケットのみが出力に含まれるように実行オプションを変更し、その結果をファイルに出力してください（list-bucket-specify.json）

4では指定のコンパートメント内の全てのバケット一覧を取得してましたが、今回は「３」で作成したバケットのみを取得して出力します。<br>


### 1、--queryを使いバケット作成者を指定して、その一覧を標準出力する
JSONのクエリ言語である JMESPath を使うと出力の指定ができます。<br>
OCI-CLIでJMESPathを利用するには、--queryオプションを使います。<br>

JMESPathの具体的な使い方は、[公式ドキュメント](https://jmespath.org/) をチェックしましょう。

（実行例）バケット名 (name) を指定した場合の標準出力

```console

ritsuko_to@cloudshell:~ (us-ashburn-1)$ oci os bucket list --compartment-id ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxx --namespace-name hoge_namespace --query 'data[?"name"==`cn_study_bucket_tf2`]'
[
   {
     "compartment-id": "ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxxxxxxx",
     "created-by": "ocid1.user.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxx",
     "defined-tags": null,
     "etag": "7df95cc4-06e6-4c3d-9295-3f03cdb1dbfe",
     "freeform-tags": null,
     "name": "cn_study_bucket_tf2",
     "namespace": "hoge_namespace",
     "time-created": "2023-10-05T04:19:05.151000+00:00"
    },
]

```

<br>

### 2、--queryを使いバケット作成者を指定して、その一覧をファイル出力する

（実行例）バケット作成者 (name) を指定した場合のファイル出力

  
```console

ritsuko_to@cloudshell:~ (us-ashburn-1)$ oci os bucket list --compartment-id ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxx --namespace-name hoge_namespace --query 'data[?"name"==`cn_study_bucket_tf2`]' > list-bucket-specify.json

```

<br>
念のため、出力されたファイルをcatして確認します。
<details><summary>（実行例）catした結果</summary><div>

```console

ritsuko_to@cloudshell:~ (us-ashburn-1)$ cat list-bucket-specify.json 
[
   {
     "compartment-id": "ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxxxxxxx",
     "created-by": "ocid1.user.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxx",
     "defined-tags": null,
     "etag": "7df95cc4-06e6-4c3d-9295-3f03cdb1dbfe",
     "freeform-tags": null,
     "name": "cn_study_bucket_tf2",
     "namespace": "hoge_namespace",
     "time-created": "2023-10-05T04:19:05.151000+00:00"
    },
]

```
</div></details>

## 参考ドキュメント
・ [JMESPath](https://jmespath.org/) 
<br>
・ [oci os bucket list](https://docs.oracle.com/en-us/iaas/tools/oci-cli/3.37.4/oci_cli_docs/cmdref/os/bucket/list.html)
