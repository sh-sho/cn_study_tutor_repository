# 1. インタラクティブ・モードでOCI CLIを実行するオプションは？

### 1. OCI CLIのインタラクティブモード

OCI CLIのインタラクティブモード(対話型モード)の`oci -i`を実行すると、ガイドを見つつコマンドを入力することができる。

OCIプロファイルが複数ある場合、`--profile <profile name>`をオプションに指定して`oci -i`を実行する。

(実行例)OCI CLIのインタラクティブ・モード

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


### (補足)プロファイルの事前設定

デフォルトのプロファイルとパラメータを~/.oci/oci_cli_rcに設定しておくことにより、OCI CLI実行時のオプションを省略することができる。~/.oci/oci_cli_rc自体のパスも変更することもできる。

(実行例)OCI CLIのプロファイル設定

```console
[opc@test-vm1 ~]$ cat ~/.oci/oci_cli_rc
[OCI_CLI_SETTINGS]
default_profile=profile_A

[profile_A]
# プロファイルAのコンパートメントID
compartment-id=ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

[profile_B]
# プロファイルBのコンパートメントID
compartment-id=ocid1.compartment.oc1..aaaaaaaabbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
[opc@test-vm1 ~]$
```

### 参考

- [OCI CLIの構成ファイルのデフォルト](https://docs.public.oneportal.content.oci.oraclecloud.com/ja-jp/iaas/Content/API/SDKDocs/cliconfigure.htm#CLIconfigfile)

- [OCI CLI インタラクティブ・モード](https://docs.public.oneportal.content.oci.oraclecloud.com/ja-jp/iaas/Content/API/SDKDocs/cliusing_topic-Using_Interactive_Mode.htm)

