variable "tenancy_ocid" {
  description = "テナンシーのOCID"
  type = string
}

variable "compartment_id" {
  description = "コンパートメントのOCID"
  type = string
}

variable "user_ocid" {
  description = "APIキーアカウントのOCID"
  type = string
}

variable "private_key_path" {
  description = "APIキーの保存場所"
  type = string
}

variable "fingerprint" {
  description = "APIキーのフィンガープリント"
  type = string
}

variable "region" {
  description = "バケットを作成するリージョン"
  type = string
  default = "ap-tokyo-1"
}

variable "bucket_name" {
  description = "バケット名称"
  type = string
  default = "testBucket-EN"
}

variable "bucket_namespace" {
  description = "バケットのネームスペース"
  type = string
}

variable "access_type" {
  description = "アクセスタイプ"
  type = string
  default = "NoPublicAccess"
}

variable "compartment_id_in_subtree" {
  description = "コンパートメントのサブツリー検索可否"
  type = string
  default = "true"
}

variable "compartment_name" {
  description = "コンパートメント名"
  type = string
}
