variable "vcn_display_name" {
  type = string
}

variable "compartment_id" {
  type = string
}

variable "tenancy_ocid" {
  type = string
}

variable "user_ocid" {
  type = string
}

variable "fingerprint" {
  type = string
}

variable "private_key_path" {
  type = string
}
# variable "public_ssh_key_path" {
#   type = string
# }

variable "region" {
  default = "us-phoenix-1"
}

variable "wordpress_db_user" {
    type = string
}

variable "wordpress_db_password" {
    type = string
}

variable "wordpress_db_name" {
    type = string
}

variable "mysql_root_password" {
    type = string
}

variable "mysql_user" {
    type = string
}

variable "mysql_password" {
    type = string
}

variable "mysql_database" {
    type = string
}
