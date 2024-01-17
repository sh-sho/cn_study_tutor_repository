# 4. Object Storageのバケット一覧のファイル（list-bucket.json）出力

OCI cliの`list`を使うことで、バケットの一覧が取得できます。
※参考：[こちら](https://docs.oracle.com/en-us/iaas/tools/oci-cli/3.37.4/oci_cli_docs/cmdref/os/bucket/list.html)がlistのドキュメントです。

## listを使って標準出力をしてみる
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
ritsuko_to@cloudshell:~ (us-ashburn-1)$ 
```
