output "vcn_id" {
  value = module.vcn.vcn_id
}
output "vcn_cidr_blocks" {
    value = module.vcn.cidr_block
}
output "vcn_display_name" {
    value = module.vcn.display_name
}
output "vcn_dns_label" {
    value = module.vcn.dns_label
}
output "default_route_table" {
    value = [oci_core_default_route_table.route_table_service_gateway.id]
}
output "oci_core_services" {
    value = data.oci_core_services.all_oci_services.services.*
}
