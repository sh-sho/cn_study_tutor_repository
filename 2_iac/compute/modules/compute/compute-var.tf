variable "source_ocid" {
  type = string
  default = "ocid1.image.oc1.phx.aaaaaaaa6dxlvblwz5msd3cqlmuy4inpytvsbjwyecpstlvak3llgyt4oqba"
}

variable "subnet_ocid" {
  type = string
}

variable "compartment_id" {
  type = string 
}

variable "display_vnic_name" {
  type = string
  default = "vnic_test"
}

variable "display_instance_name" {
  type = string
  default = "tf-test"
}

variable "public_ssh_key_path" {
  type = string
  default = "~/.ssh/id_rsa.pub"
}

variable "instance_availability_domain" {
  type = string
  default = "TGjA:PHX-AD-1"
}




