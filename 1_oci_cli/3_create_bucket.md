# 3. Object StorageのBucket作成

OCI CLIでのBucket作成手順となります。OCIコンソール上での作成手順は省略しています。

### 1. OCI CLIコマンドによるバケット作成

(実行例)OCI CLIでcn-study-bucketバケットを作成する

```console
[opc@test-vm1 ~]$ oci -i
> oci os bucket create --compartment-id ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx --name cn-study-bucket --namespace-name xxxxxx
{
  "data": {
    "approximate-count": null,
    "approximate-size": null,
    "auto-tiering": null,
    "compartment-id": "ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
    "created-by": "ocid1.user.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
    "defined-tags": {
      "Oracle-Tags": {
        "CreatedBy": "oracleidentitycloudservice/hoge@hoge.com",
        "CreatedOn": "2024-01-17T05:01:59.319Z"
      }
    },
    "etag": "2f372320-ecc8-4d85-8c3e-xxxxxxxxxxxx",
    "freeform-tags": {},
    "id": "ocid1.bucket.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
    "is-read-only": false,
    "kms-key-id": null,
    "metadata": {},
    "name": "cn-study-bucket",
    "namespace": "xxxxxx",
    "object-events-enabled": false,
    "object-lifecycle-policy-etag": null,
    "public-access-type": "NoPublicAccess",
    "replication-enabled": false,
    "storage-tier": "Standard",
    "time-created": "2024-01-17T05:01:59.328000+00:00",
    "versioning": "Disabled"
  },
  "etag": "2f372320-ecc8-4d85-8c3e-xxxxxxxxxxxx"
}
```


### 2. JSONフォーマットを使用したOCI CLIコマンドによるバケット作成

create_bucket.jsonについては、[OCI CLI実行に必要なパラメータをJSONフォーマットで確認するオプション（2つ）](./2_ocicli_option.md)を参照ください。

(実行例)JSONフォーマットを使用して、OCI CLIでcn-study-bucketバケットを作成する

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
    "name": "cn-study-bucket",
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
