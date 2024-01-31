terraform {
    required_providers {
        oci = {
            source  = "oracle/oci"
            version = ">= 5.0.0"
        }
    }
}

locals {
    cidr_blocks = "10.0.0.0/16"
    display_name = "VCN_TEST"
    dns_label = "vcntest"
}

variable "compartment_id" {}

resource "oci_core_vcn" "generated_oci_core_vcn" {
	cidr_blocks = [local.cidr_blocks]
	compartment_id = var.compartment_id
	display_name = local.display_name
	dns_label = local.dns_label
	is_ipv6enabled = "false"
}

output "vcn_id" {
    value = oci_core_vcn.generated_oci_core_vcn.id
}
output "cidr_block" {
    value = oci_core_vcn.generated_oci_core_vcn.cidr_block
}
output "display_name" {
    value = oci_core_vcn.generated_oci_core_vcn.display_name
}
output "dns_label" {
    value = oci_core_vcn.generated_oci_core_vcn.dns_label
}
output "default_security_list_id" {
    value = oci_core_vcn.generated_oci_core_vcn.default_security_list_id
}
output "default_route_table_id" {
    value = oci_core_vcn.generated_oci_core_vcn.default_route_table_id
}

