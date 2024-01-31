# Object StorageのBucketをTerraformで作成する

### Let's THINK!!

1. TerraformのPlan情報を保存しておきたいときは、どのようにすればいいでしょうか？
2. Terraformの実行結果の状態を保持しておく方法は、どのようになっているでしょうか？
3. Githubに機密情報を保存したくない場合、どのようにすればいいでしょうか？
4. Terraform ProviderでOCI用の設定をしないとWarningが出ますが、その理由はなんでしょうか？また、どのように対応すればいいでしょうか？
5. コンパートメントのocidを直接指定するのではなく、コンパートメント名称で指定する方法は、どのようにすればいいでしょうか？

### Terraform設定ファイル

- OCIからコンパートメントOCIDを取得するための情報を記載：  [dataresource.tf](./object_storage/dataresources.tf)
- Object Storageを作成するための情報を記載：  [objectstorage.tf](./object_storage/objectstorage.tf)
- `terraform apply`実行後の出力結果で表示する項目を記載：  [outputs.tf](./object_storage/outputs.tf)
- OCIへアクセスするためのプロバイダー情報を記載：  [provider.tf](./object_storage/provider.tf)
- 変数として使用する情報を記載：  [variables.tf](./object_storage/variables.tf)

※ OCIのテナンシーOCID、ユーザーOCID、APIキーの情報を記載したterraform.tfvarsは記載していない

`terraform.tfvars`
```hcl
tenancy_ocid="ocid1.tenancy.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
user_ocid="ocid1.user.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxx"
private_key_path="/home/opc/.ssh/xxxxxxx.pem"
fingerprint="XX:XX:ab:88:ef:17:89:79:0d:XX:XX:XX:XX:XX:XX:XX"
region="ap-tokyo-1"
bucket_namespace = "xxxxxxx"
compartment_name = "xxxxxxx"
```

### (実行例)terraform init

```console
[opc@test-vm1 object_storage]$ terraform init

Initializing the backend...

Initializing provider plugins...
- Finding oracle/oci versions matching ">= 4.90.0"...
- Installing oracle/oci v5.25.0...
- Installed oracle/oci v5.25.0 (signed by a HashiCorp partner, key ID 1533A49284137CEB)

Partner and community providers are signed by their developers.
If you'd like to know more about provider signing, you can read about it here:
https://www.terraform.io/docs/cli/plugins/signing.html

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

### (実行例)terraform plan
```console
[opc@test-vm1 object_storage]$ terraform plan
data.oci_identity_compartments.target_compartment: Reading...
data.oci_identity_compartments.target_compartment: Read complete after 0s [id=IdentityCompartmentsDataSource-550476753]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # oci_objectstorage_bucket.test_bucket will be created
  + resource "oci_objectstorage_bucket" "test_bucket" {
      + access_type                  = "NoPublicAccess"
      + approximate_count            = (known after apply)
      + approximate_size             = (known after apply)
      + auto_tiering                 = (known after apply)
      + bucket_id                    = (known after apply)
      + compartment_id               = "ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
      + created_by                   = (known after apply)
      + defined_tags                 = (known after apply)
      + etag                         = (known after apply)
      + freeform_tags                = (known after apply)
      + id                           = (known after apply)
      + is_read_only                 = (known after apply)
      + kms_key_id                   = (known after apply)
      + name                         = "testBucket-EN"
      + namespace                    = "xxxxxxxxxxxxxx"
      + object_events_enabled        = (known after apply)
      + object_lifecycle_policy_etag = (known after apply)
      + replication_enabled          = (known after apply)
      + storage_tier                 = (known after apply)
      + time_created                 = (known after apply)
      + versioning                   = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + bucket_name        = {
      + access_type                  = "NoPublicAccess"
      + approximate_count            = (known after apply)
      + approximate_size             = (known after apply)
      + auto_tiering                 = (known after apply)
      + bucket_id                    = (known after apply)
      + compartment_id               = "ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
      + created_by                   = (known after apply)
      + defined_tags                 = (known after apply)
      + etag                         = (known after apply)
      + freeform_tags                = (known after apply)
      + id                           = (known after apply)
      + is_read_only                 = (known after apply)
      + kms_key_id                   = (known after apply)
      + metadata                     = null
      + name                         = "testBucket-EN"
      + namespace                    = "xxxxxxxxxxxxxx"
      + object_events_enabled        = (known after apply)
      + object_lifecycle_policy_etag = (known after apply)
      + replication_enabled          = (known after apply)
      + retention_rules              = []
      + storage_tier                 = (known after apply)
      + time_created                 = (known after apply)
      + timeouts                     = null
      + versioning                   = (known after apply)
    }
  + target_compartment = "ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.

```

### (実行例)terraform apply
```console
[opc@test-vm1 object_storage]$ terraform apply
data.oci_identity_compartments.target_compartment: Reading...
data.oci_identity_compartments.target_compartment: Read complete after 0s [id=IdentityCompartmentsDataSource-550476753]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # oci_objectstorage_bucket.test_bucket will be created
  + resource "oci_objectstorage_bucket" "test_bucket" {
      + access_type                  = "NoPublicAccess"
      + approximate_count            = (known after apply)
      + approximate_size             = (known after apply)
      + auto_tiering                 = (known after apply)
      + bucket_id                    = (known after apply)
      + compartment_id               = "ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
      + created_by                   = (known after apply)
      + defined_tags                 = (known after apply)
      + etag                         = (known after apply)
      + freeform_tags                = (known after apply)
      + id                           = (known after apply)
      + is_read_only                 = (known after apply)
      + kms_key_id                   = (known after apply)
      + name                         = "testBucket-EN"
      + namespace                    = "xxxxxxxxxxxxxx"
      + object_events_enabled        = (known after apply)
      + object_lifecycle_policy_etag = (known after apply)
      + replication_enabled          = (known after apply)
      + storage_tier                 = (known after apply)
      + time_created                 = (known after apply)
      + versioning                   = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + bucket_name        = {
      + access_type                  = "NoPublicAccess"
      + approximate_count            = (known after apply)
      + approximate_size             = (known after apply)
      + auto_tiering                 = (known after apply)
      + bucket_id                    = (known after apply)
      + compartment_id               = "ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
      + created_by                   = (known after apply)
      + defined_tags                 = (known after apply)
      + etag                         = (known after apply)
      + freeform_tags                = (known after apply)
      + id                           = (known after apply)
      + is_read_only                 = (known after apply)
      + kms_key_id                   = (known after apply)
      + metadata                     = null
      + name                         = "testBucket-EN"
      + namespace                    = "xxxxxxxxxxxxxx"
      + object_events_enabled        = (known after apply)
      + object_lifecycle_policy_etag = (known after apply)
      + replication_enabled          = (known after apply)
      + retention_rules              = []
      + storage_tier                 = (known after apply)
      + time_created                 = (known after apply)
      + timeouts                     = null
      + versioning                   = (known after apply)
    }
  + target_compartment = "ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

oci_objectstorage_bucket.test_bucket: Creating...
oci_objectstorage_bucket.test_bucket: Creation complete after 1s [id=n/xxxxxxxxxxxxxx/b/testBucket-EN]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

bucket_name = {
  "access_type" = "NoPublicAccess"
  "approximate_count" = "0"
  "approximate_size" = "0"
  "auto_tiering" = "Disabled"
  "bucket_id" = "ocid1.bucket.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  "compartment_id" = "ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  "created_by" = "ocid1.user.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  "defined_tags" = tomap({
    "Oracle-Tags.CreatedBy" = "oracleidentitycloudservice/hoge@hoge.com"
    "Oracle-Tags.CreatedOn" = "2024-01-31T13:00:50.436Z"
  })
  "etag" = "18bbcde8-c6d2-4dea-a908-eca821638e12"
  "freeform_tags" = tomap({})
  "id" = "n/xxxxxxxxxxxxxx/b/testBucket-EN"
  "is_read_only" = false
  "kms_key_id" = tostring(null)
  "metadata" = tomap(null) /* of string */
  "name" = "testBucket-EN"
  "namespace" = "xxxxxxxxxxxxxx"
  "object_events_enabled" = false
  "object_lifecycle_policy_etag" = tostring(null)
  "replication_enabled" = false
  "retention_rules" = toset([])
  "storage_tier" = "Standard"
  "time_created" = "2024-01-31 13:00:50.468 +0000 UTC"
  "timeouts" = null /* object */
  "versioning" = "Disabled"
}
target_compartment = "ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

```

### (実行例)terraform apply -destroy
```console
[opc@test-vm1 object_storage]$ terraform apply -destroy
data.oci_identity_compartments.target_compartment: Reading...
data.oci_identity_compartments.target_compartment: Read complete after 0s [id=IdentityCompartmentsDataSource-550476753]
oci_objectstorage_bucket.test_bucket: Refreshing state... [id=n/xxxxxxxxxxxxxx/b/testBucket-EN]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # oci_objectstorage_bucket.test_bucket will be destroyed
  - resource "oci_objectstorage_bucket" "test_bucket" {
      - access_type           = "NoPublicAccess" -> null
      - approximate_count     = "0" -> null
      - approximate_size      = "0" -> null
      - auto_tiering          = "Disabled" -> null
      - bucket_id             = "ocid1.bucket.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -> null
      - compartment_id        = "ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -> null
      - created_by            = "ocid1.user.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -> null
      - defined_tags          = {
          - "Oracle-Tags.CreatedBy" = "oracleidentitycloudservice/hoge@hoge.com"
          - "Oracle-Tags.CreatedOn" = "2024-01-31T13:00:50.436Z"
        } -> null
      - etag                  = "18bbcde8-c6d2-4dea-a908-eca821638e12" -> null
      - freeform_tags         = {} -> null
      - id                    = "n/xxxxxxxxxxxxxx/b/testBucket-EN" -> null
      - is_read_only          = false -> null
      - metadata              = {} -> null
      - name                  = "testBucket-EN" -> null
      - namespace             = "xxxxxxxxxxxxxx" -> null
      - object_events_enabled = false -> null
      - replication_enabled   = false -> null
      - storage_tier          = "Standard" -> null
      - time_created          = "2024-01-31 13:00:50.468 +0000 UTC" -> null
      - versioning            = "Disabled" -> null
    }

Plan: 0 to add, 0 to change, 1 to destroy.

Changes to Outputs:
  - bucket_name        = {
      - access_type                  = "NoPublicAccess"
      - approximate_count            = "0"
      - approximate_size             = "0"
      - auto_tiering                 = "Disabled"
      - bucket_id                    = "ocid1.bucket.oc1.ap-tokyo-1.xaaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
      - compartment_id               = "ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
      - created_by                   = "ocid1.user.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
      - defined_tags                 = {
          - "Oracle-Tags.CreatedBy" = "oracleidentitycloudservice/hoge@hoge.com"
          - "Oracle-Tags.CreatedOn" = "2024-01-31T13:00:50.436Z"
        }
      - etag                         = "18bbcde8-c6d2-4dea-a908-eca821638e12"
      - freeform_tags                = {}
      - id                           = "n/xxxxxxxxxxxxxx/b/testBucket-EN"
      - is_read_only                 = false
      - kms_key_id                   = null
      - metadata                     = {}
      - name                         = "testBucket-EN"
      - namespace                    = "xxxxxxxxxxxxxx"
      - object_events_enabled        = false
      - object_lifecycle_policy_etag = null
      - replication_enabled          = false
      - retention_rules              = []
      - storage_tier                 = "Standard"
      - time_created                 = "2024-01-31 13:00:50.468 +0000 UTC"
      - timeouts                     = null
      - versioning                   = "Disabled"
    } -> null
  - target_compartment = "ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -> null

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

oci_objectstorage_bucket.test_bucket: Destroying... [id=n/xxxxxxxxxxxxxx/b/testBucket-EN]
oci_objectstorage_bucket.test_bucket: Destruction complete after 2s

Apply complete! Resources: 0 added, 0 changed, 1 destroyed.

```

