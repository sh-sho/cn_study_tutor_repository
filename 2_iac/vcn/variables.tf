# OCI info
variable "tenancy_ocid" {
    type = string
}
variable "user_ocid" {
    type = string
}
variable "private_key_path" {
    type = string
}
variable "fingerprint" {
    type = string
}
variable "region" {
    type = string
}
variable "compartment_id" {
    type = string
}

# VCN
variable "cidr_blocks" {
    type = string
    default = "10.0.0.0/16"
}
variable "display_name" {
    type = string
    default = "VCN_TEST"
}
variable "dns_label" {
    type = string
    default = "vcntest"
}

# private subet
variable "cidr_block_private" {
    type = string
    default = "10.0.1.0/24"
}
variable "subnet_display_name_private" {
    type = string
    default = "private_subnet"
}
variable "subnet_dns_label_private" {
    type = string
    default = "private"
}

# public subnet
variable "cidr_block_public" {
    type = string
    default = "10.0.2.0/24"
}
variable "subnet_display_name_public" {
    type = string
    default = "public_subnet"
}
variable "subnet_dns_label_public" {
    type = string
    default = "public"
}

# security list
variable "security_list_display_name_1" {
    type = string
    default = "private_security_list"
}
variable "security_list_ingress_security_rules_protocol_1" {
    type = string
    default = "6"
}
variable "security_list_ingress_security_rules_source_1" {
    type = string
    default = "192.168.1.0/24"
}
variable "security_list_ingress_security_rules_tcp_options_destination_port_range_min_1" {
    type = string
    default = "21"
}
variable "security_list_ingress_security_rules_tcp_options_destination_port_range_max_1" {
    type = string
    default = "22"
}
variable "security_list_egress_security_rules_destination_1" {
    type = string
    default = "0.0.0.0/0"
}
variable "security_list_egress_security_rules_protocol_1" {
    type = string
    default = "ALL"
}
variable "security_list_display_name_default" {
    type = string
    default = "default_security_list"
}

# route table
variable "route_table_display_name" {
    type = string
    default = "route_table_private"
}
variable "route_table_display_name_1" {
    type = string
    default = "route_table_public"
}
variable "route_table_route_rules_destination" {
    type = string
    default = "0.0.0.0/0"
}
variable "route_table_route_rules_destination_type" {
    type = string
    default = "CIDR_BLOCK"
}
variable "route_table_route_rules_destination_service_gateway" {
    type = string
    #default = "All NRT Services In Oracle Services Network"
    default = ""
}
variable "route_table_route_rules_destination_service_gateway_type" {
    type = string
    default = "SERVICE_CIDR_BLOCK"
}

# internet gateway
variable "internet_gateway_display_name" {
    type = string
    default = "internet_gateway"
}

# nat gateway
variable "nat_gateway_display_name" {
    type = string
    default = "nat_gateway"
}

# service gateway
variable "service_gateway_display_name" {
    type = string
    default = "service_gateway"
}
