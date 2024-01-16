# 1. OCI CLIのインタラクティブ・モード

OCI CLIのインタラクティブモード(対話型モード)の`oci -i`を実行すると、ガイドを見つつコマンドを入力することができる。

https://docs.public.oneportal.content.oci.oraclecloud.com/ja-jp/iaas/Content/API/SDKDocs/cliusing_topic-Using_Interactive_Mode.htm

- (補足)OCIプロファイルが複数ある場合は、`--profile <profile name>`をオプションに指定して`oci -i`を実行する。

<details><summary>(実行例)OCI CLIのインタラクティブモード</summary><div>

```console
[opc@test-vm1 ~]$ oci -i --profile test  # OCIプロファイルが`test`の場合
> oci os ns get
{
  "data": "hoge_namespace"
}
[opc@test-vm1 ~]$
[opc@test-vm1 ~]$ oci -i --profile test
> oci os bucket list --compartment-id ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxx --namespace-name hoge_namespace
{
  "data": [
    {
      "compartment-id": "ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxx",
      "created-by": "ocid1.saml2idp.oc1..aaaaaaaagxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx/hoge@hoge.com",
      "defined-tags": null,
      "etag": "1e0aadda-e38f-439f-92ce-0a7e70d91cc3",
      "freeform-tags": null,
      "name": "hoge_bucket",
      "namespace": "hoge_namespace",
      "time-created": "2022-11-15T00:39:43.934000+00:00"
    }
  ]
}
[opc@test-vm1 ~]$
```
</div></details>