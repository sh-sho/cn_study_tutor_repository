variable "tenancy_ocid" {
  # テナンシーのOCID
  type = string
}

variable "user_ocid" {
  # APIキーアカウントのOCID
  type = string
}

variable "private_key_path" {
  # APIキーの保存場所
  type = string
}

variable "fingerprint" {
  # APIキーのフィンガープリント
  type = string
}

variable "region" {
  # バケットを作成するリージョン
  type = string
  default = "ap-tokyo-1"
}

variable "bucket_name" {
  # バケット名称
  type = string
  default = "testBucket-EN"
}

variable "bucket_namespace" {
  # バケットのネームスペース
  type = string
}

variable "access_type" {
  # アクセスタイプ
  type = string
  default = "NoPublicAccess"
}

variable "compartment_compartment_id_in_subtree" {
  type = string
  default = "true"
}

variable "compartment_name" {
  type = string
}