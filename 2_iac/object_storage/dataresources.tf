# data from https://registry.terraform.io/providers/oracle/oci/latest/docs/data-sources/identity_compartments
data "oci_identity_compartments" "target_compartment" {
    compartment_id = var.tenancy_ocid
    compartment_id_in_subtree = var.compartment_compartment_id_in_subtree
    name = var.compartment_name
}