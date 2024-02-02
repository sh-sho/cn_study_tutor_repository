variable "compartment_id" {
  type = string
}

# VCN
variable "vcn_cidr_blocks" {
    type = list(string)
    default = ["10.10.0.0/16"]
}

variable "vcn_display_name" {
    type = string
    default = "test_VCN"
}

variable "vcn_dns_label" {
    type = string
    default = "vcntest"
}

# Internet Gateway
variable "internet_gateway_display_name" {
    type = string
    default = "test_IGW"
}

#Route Table (default route table)
variable "route_table_display_name" {
   type = string
   default = "default_route_table"
}

variable "default_route_table_route_rules_destination" {
    type = string
    default = "0.0.0.0/0"
}

variable "default_route_table_route_rules_destination_type" {
    type = string
    default = "CIDR_BLOCK"
}

# Nat Gateway
variable "nat_gateway_display_name" {
   type = string
   default = "NAT_GATE_WAY_test"
}

# Service Gateway
variable "service_gateway_display_name" {
    type = string
    default = "SERVICE_GATE_WAY_test"
}

# Route Table (private route table)
variable "private_subnet_route_table_display_name" {
    type = string
    default = "private_subnet_route_table"
}

variable "private_route_table_route_rules_destination" {
    type = string
    default = "0.0.0.0/0"
}

variable "private_route_table_route_rules_destination_type" {
    type = string
    default = "CIDR_BLOCK"
}

variable "private_route_table_route_rules_destination_service_gateway_type" {
    type = string
    default = "SERVICE_CIDR_BLOCK"
}

# Security List (Public)
variable "public_security_list_display_name" {
    type = string
    default = "public_security_list"
}

variable "public_security_list_egress_security_rules_destination" {
    type = string
    default = "0.0.0.0/0"
}

variable "public_security_list_egress_security_rules_protocol" {
    type = string
    default = "ALL"
}

variable "public_security_list_ingress_security_rules_protocol" {
    type = string
    default = "6"
}

variable "public_security_list_ingress_security_rules_source" {
    type = string
    default = "0.0.0.0/0"
}

variable "public_security_list_ingress_security_rules_tcp_options_destination_port_range_max" {
    type = string
    default = "22"
}

variable "public_security_list_ingress_security_rules_tcp_options_destination_port_range_min" {
    type = string
    default = "22"
}

variable "public_security_list_ingress_security_rules_protocol_2" {
    type = string
    default = "1"
}

variable "public_security_list_ingress_security_rules_source_2" {
    type = string
    default = "0.0.0.0/0"
}

variable "public_security_list_ingress_security_rules_icmp_options_type_2" {
    type = string
    default = "3"
}

variable "public_security_list_ingress_security_rules_icmp_options_code_2" {
    type = string
    default = "4"
}
variable "public_security_list_ingress_security_rules_protocol_3" {
    type = string
    default = "1"
}

variable "public_security_list_ingress_security_rules_source_3" {
    type = string
    default = "10.10.0.0/16"
}

variable "public_security_list_ingress_security_rules_icmp_options_type_3" {
    type = string
    default = "3"
}

# Security List (Private)
variable "private_security_list_display_name" {
    type = string
    default = "private_security_list"
}

variable "private_security_list_egress_security_rules_destination" {
    type = string
    default = "0.0.0.0/0"
}

variable "private_security_list_egress_security_rules_protocol" {
    type = string
    default = "ALL"
}

variable "private_security_list_ingress_security_rules_protocol" {
    type = string
    default = "6"
}

variable "private_security_list_ingress_security_rules_source" {
    type = string
    default = "10.10.0.0/16"
}

variable "private_security_list_ingress_security_rules_tcp_options_destination_port_range_max" {
    type = string
    default = "22"
}

variable "private_security_list_ingress_security_rules_tcp_options_destination_port_range_min" {
    type = string
    default = "22"
}

variable "private_security_list_ingress_security_rules_protocol_2" {    
    type = string
    default = "1"
}

variable "private_security_list_ingress_security_rules_source_2" {
    type = string
    default = "0.0.0.0/0"
}

variable "private_security_list_ingress_security_rules_icmp_options_type_2" {
    type = string
    default = "3"
}

variable "private_security_list_ingress_security_rules_icmp_options_code_2" {
    type = string
    default = "4"
}

variable "private_security_list_ingress_security_rules_protocol_3" {
    type = string
    default = "1"
}

variable "private_security_list_ingress_security_rules_source_3" {
    type = string
    default = "10.10.0.0/16"
}

variable "private_security_list_ingress_security_rules_icmp_options_type_3" {
    type = string
    default = "3"
}

# Subnet (Public)
variable "public_subnet_cidr_block" {
    type = string
    default = "10.10.0.0/24"
}

variable "public_subnet_display_name" {
    type = string
    default = "public_subnet_test"
}

variable "public_subnet_dns_label" {
    type = string
    default = "public"
}



# Subnet (Private)
variable "private_subnet_cidr_block" {
    type = string
    default = "10.10.1.0/24"
}

variable "private_subnet_display_name" {
    type = string
    default = "private_subnet_test"
}

variable "private_subnet_dns_label" {
    type = string
    default = "private"
}
