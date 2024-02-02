variable "display_vnic_name" {
  type = string
}

variable "display_instance_name" {
  type = string
}

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
variable "public_ssh_key_path" {
  type = string
}

variable "region" {
  default = "us-phoenix-1"
}

variable "instance_availability_domain" {
  default = "TGjA:PHX-AD-1"
}




