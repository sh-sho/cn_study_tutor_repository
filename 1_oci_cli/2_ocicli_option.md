# 2. OCI CLI実行に必要なパラメータをJSONフォーマットで確認するオプション

OCI CLIでパラメータを確認する方法は二通りある。
1. コマンド・オプションの場合、--generate-param-json-inputを使用して、JSONを取得するコマンド・オプションを指定する。
2. コマンド全体の場合、--generate-full-command-json-inputを使用する。

### 1. --generate-param-json-input [complex type]

OCI CLIのオプションでcomplex typeとなっている種類の情報をJSONフォーマットで出力する

<details><summary>(実行例)バケット作成コマンドでfreeform-tagsオプションのフォーマットを確認する</summary><div>

```console
[opc@test-vm1 ~]$ oci os bucket create --generate-param-json-input freeform-tags
{
  "tagKey1": "tagValue1",
  "tagKey2": "tagValue2"
}
[opc@test-vm1 ~]$
```

</div></details>

### 2. --generate-full-command-json-input

OCI CLIの全てのオプションの入力情報をJSONフォーマットで出力する

<details><summary>(実行例)バケット作成コマンドで全オプションのフォーマットを確認する</summary><div>

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
</div></details>

### 3. --generate-full-command-json-inputの出力結果から、バケット作成用JSONファイルを作成する

--generate-full-command-json-inputの出力結果から必要な項目を抽出し、任意のコンパートメントに、名称：test_bucket、プライベートアクセス、ストレージ層：標準、バージョニング：無し、のバケットを作成するJSONファイル。

`create_bucket.json`バケット作成インプット用JSONファイル
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
  "name": "test_bucket",
  "namespace": "xxxxxxx",
  "namespaceName": "xxxxxxx",
  "objectEventsEnabled": true,
  "publicAccessType": "NoPublicAccess",
  "storageTier": "Standard",
  "versioning": "Disabled"
}
```

<details><summary>(実行例)JSONフォーマットを使用したバケット作成</summary><div>

```console
[opc@test-vm1 ~]$ oci os bucket create --from-json file://create_bucket.json
{
  "data": {
    "approximate-count": null,
    "approximate-size": null,
    "auto-tiering": null,
    "compartment-id": "ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxx",
    "created-by": "ocid1.user.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
    "defined-tags": {
      "Oracle-Tags": {
        "CreatedBy": "oracleidentitycloudservice/hoge@hogehoge.com",
        "CreatedOn": "2024-01-17T02:42:12.834Z"
      },
      "defineTag1": {
        "definedTagKey1": "definedTagValue1"
      }
    },
    "etag": "ef676a3b-dfb5-4978-bc15-xxxxxxxxxx",
    "freeform-tags": {
      "freeTagKey1": "tagValue1",
      "freeTagKey2": "tagValue2"
    },
    "id": "ocid1.bucket.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
    "is-read-only": false,
    "kms-key-id": null,
    "metadata": {},
    "name": "test_bucket",
    "namespace": "xxxxxx",
    "object-events-enabled": true,
    "object-lifecycle-policy-etag": null,
    "public-access-type": "NoPublicAccess",
    "replication-enabled": false,
    "storage-tier": "Standard",
    "time-created": "2024-01-17T02:42:12.842000+00:00",
    "versioning": "Disabled"
  },
  "etag": "ef676a3b-dfb5-4978-bc15-xxxxxxxxxx"
}
[opc@test-vm1 ~]$
```

</div></details>


### 参考

- [oci os bucket create [OPTIONS]](https://docs.oracle.com/en-us/iaas/tools/oci-cli/3.37.4/oci_cli_docs/cmdref/os/bucket/create.html
)

- [OCI CLIのJSON拡張オプション](https://docs.public.oneportal.content.oci.oraclecloud.com/ja-jp/iaas/Content/API/SDKDocs/cliusing.htm#AdvancedJSON)