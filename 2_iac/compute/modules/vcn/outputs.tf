# Outputs for vcn

output "vcn_id" {
    value = oci_core_vcn.test_vcn.id
}

output "public_subnet_id" {
    value = oci_core_subnet.public_subnet.id
}

output "private_subnet_id" {
    value = oci_core_subnet.private_subnet.id
}


