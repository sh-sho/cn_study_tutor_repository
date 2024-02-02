
variable "tenancy_ocid" {
    description = "tenancy ocid"
    type = string
}
variable "user_ocid" {
    description = "user ocid"
    type = string
}
variable "private_key_path" {
    description = "user api key"
    type = string
}
variable "fingerprint" {
    description = "api key finger print"
    type = string
}
variable "compartment_id" {
    description = "compartment ocid"
    type = string
}
variable "region" {
    description = "region"
    type = string
    default = "ap-tokyo-1"
}
