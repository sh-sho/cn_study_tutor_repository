# 4. Object Storageのバケット一覧のファイル（list-bucket.json）出力

OCI cliの`list`を使うことで、バケットの一覧が取得できます。


## 1、listを使って標準出力をしてみる
ひとまずlistを使うとどのように出力されるか見てみたいので、純粋に標準出力してみる。

<details><summary>（実行例）標準出力</summary><div>
  
```console
ritsuko_to@cloudshell:~ (us-ashburn-1)$ oci os bucket list --compartment-id ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxxxxxxx --namespace-name hoge_namespace 
{
  "data": [
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
    {
      "compartment-id": "ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxxxxxxx",
      "created-by": "ocid1.saml2idp.oc1..aaaaaaaarxxxxxxxxxxxxxxxxxxxxxxxxxxxx/hoge.hoge@oracle.com",
      "defined-tags": null,
      "etag": "d3913cf0-5f8d-45e7-81b3-cd99ebd0f215",
      "freeform-tags": null,
      "name": "test_bucket-20231101-2011_clone",
      "namespace": "hoge_namespace",
      "time-created": "2023-11-01T11:11:36.442000+00:00"
    }
  ]
}
```
</div></details>


## 2、listを使ってファイル出力をしてみる
今回のゴールはファイル出力になるため、実行例のようにファイル出力を指定する。

<details><summary>（実行例）ファイル出力</summary><div>
  
```console
ritsuko_to@cloudshell:~ (us-ashburn-1)$ oci os bucket list --compartment-id ocid1.compartment.oc1..aaaaaaaabuuk3ndv2ekfscm5fz5qx2s7cvb5sg5euuvvisz5cejrdve3fqda --namespace-name orasejapan > os_list.json
```
</div></details>

### ※参考ドキュメント
・ [oci os bucket list](https://docs.oracle.com/en-us/iaas/tools/oci-cli/3.37.4/oci_cli_docs/cmdref/os/bucket/list.html)

