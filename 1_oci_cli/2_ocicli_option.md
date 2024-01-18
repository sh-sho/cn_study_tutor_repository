# 2. OCI CLI実行に必要なパラメータをJSONフォーマットで確認するオプション(2つ)

OCI CLIでパラメータを確認する方法は二通りある。

### 1. コマンド・オプション　--generate-param-json-input [complex type]

OCI CLIのオプションでcomplex typeとなっている種類の情報をJSONフォーマットで出力するオプション

(実行例)バケット作成コマンドでfreeform-tagsオプションのフォーマットを確認する

```console
[opc@test-vm1 ~]$ oci os bucket create --generate-param-json-input freeform-tags
{
  "tagKey1": "tagValue1",
  "tagKey2": "tagValue2"
}
[opc@test-vm1 ~]$
```

### 2. コマンド全体　--generate-full-command-json-input

OCI CLIの全てのオプションの入力情報をJSONフォーマットで出力するオプション

(実行例)バケット作成コマンドで全オプションのフォーマットを確認する

```console
[opc@test-vm1 ~]$ oci os bucket create --generate-full-command-json-input
{
  "autoTiering": "string",
  "compartmentId": "string",
  "definedTags": {
    "tagNamespace1": {
      "tagKey1": "tagValue1",
      "tagKey2": "tagValue2"
    },
    "tagNamespace2": {
      "tagKey1": "tagValue1",
      "tagKey2": "tagValue2"
    }
  },
  "freeformTags": {
    "tagKey1": "tagValue1",
    "tagKey2": "tagValue2"
  },
  "kmsKeyId": "string",
  "metadata": {
    "string1": "string",
    "string2": "string"
  },
  "name": "string",
  "namespace": "string",
  "namespaceName": "string",
  "objectEventsEnabled": true,
  "publicAccessType": "NoPublicAccess|ObjectRead|ObjectReadWithoutList",
  "storageTier": "Standard|Archive",
  "versioning": "Enabled|Disabled"
}
[opc@test-vm1 ~]$
```

### (参考) --generate-full-command-json-inputの出力結果から、バケット作成用JSONファイルを作成する

--generate-full-command-json-inputの出力結果から必要な項目を抽出し、任意のコンパートメントに、名称：cn-study-bucket、アクセスタイプ：プライベートアクセス、ストレージ層：標準、バージョニング：無し、のバケットを作成するJSONファイルを作成する

`create_bucket.json`

```JSON
{
  "autoTiering": null,
  "compartmentId": "ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxx",
  "definedTags": {
    "defineTag1": {
      "definedTagKey1": "definedTagValue1"
    }
  },
  "freeformTags":  {
    "tagKey1": "tagValue1",
    "tagKey2": "tagValue2"
  },
  "kmsKeyId": null,
  "metadata": {},
  "name": "cn-study-bucket",
  "namespace": "xxxxxxx",
  "namespaceName": "xxxxxxx",
  "objectEventsEnabled": true,
  "publicAccessType": "NoPublicAccess",
  "storageTier": "Standard",
  "versioning": "Disabled"
}
```

 JSONフォーマットを使用したバケット作成の実行例は[3. Object Storage – Bucket（cn-study-xxx）を作成してください](./3_create_bucket.md)を参照

### 参考

- [oci os bucket create [OPTIONS]](https://docs.oracle.com/en-us/iaas/tools/oci-cli/3.37.4/oci_cli_docs/cmdref/os/bucket/create.html
)

- [OCI CLIのJSON拡張オプション](https://docs.public.oneportal.content.oci.oraclecloud.com/ja-jp/iaas/Content/API/SDKDocs/cliusing.htm#AdvancedJSON)
