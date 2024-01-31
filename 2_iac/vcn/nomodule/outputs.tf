output "vcn_id" {
  value = oci_core_vcn.generated_oci_core_vcn.id
}

output "cidr_blocks" {
    value = oci_core_vcn.generated_oci_core_vcn.cidr_blocks
}
output "default_dhcp_options_id" {
    value = oci_core_vcn.generated_oci_core_vcn.default_dhcp_options_id
}
output "default_route_table_id" {
    value = oci_core_vcn.generated_oci_core_vcn.default_route_table_id
}
output "default_security_list_id" {
    value = oci_core_vcn.generated_oci_core_vcn.default_security_list_id
}
output "display_name" {
    value = oci_core_vcn.generated_oci_core_vcn.display_name
}
output "dns_label" {
    value = oci_core_vcn.generated_oci_core_vcn.dns_label
}

# test output
output "private_security_list" {
    value = [oci_core_security_list.private_security_list.id]
}
output "default_route_table" {
    value = [oci_core_default_route_table.route_table_service_gateway.id]
}
output "oci_core_services" {
    value = data.oci_core_services.all_oci_services.services.*
}