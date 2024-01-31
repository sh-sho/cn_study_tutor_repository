# OCI info
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


# VCN
variable "cidr_blocks" {
    description = "VCN cider block"
    type = string
    default = "10.0.0.0/16"
}
variable "display_name" {
    description = "VCN display name"
    type = string
    default = "VCN_TEST"
}
variable "dns_label" {
    description = "VCN DNS label"
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
variable "security_list_display_name_private" {
    type = string
    default = "private_security_list"
}
variable "security_list_ingress_security_rules_protocol_private" {
    description = "private all, ICMP (1), TCP (6), UDP (17), and ICMPv6 (58)"
    type = string
    default = "6"
}
variable "security_list_ingress_security_rules_protocol_public" {
    description = "public all, ICMP (1), TCP (6), UDP (17), and ICMPv6 (58)"
    type = string
    default = "6"
}
variable "security_list_ingress_security_rules_source_private" {
    type = string
    default = "10.0.0.0/16"
}
variable "security_list_ingress_security_rules_source_public" {
    description = "public ingress souce cidr"
    type = string
    default = "0.0.0.0/0"
}

variable "security_list_ingress_security_rules_tcp_options_destination_port_range_min_private" {
    type = string
    default = "443"
}
variable "security_list_ingress_security_rules_tcp_options_destination_port_range_max_private" {
    type = string
    default = "443"
}

variable "security_list_ingress_security_rules_tcp_options_destination_port_range_min_public" {
    type = string
    default = "22"
}
variable "security_list_ingress_security_rules_tcp_options_destination_port_range_max_public" {
    type = string
    default = "22"
}

variable "security_list_egress_security_rules_destination_public" {
    description = "public egress destination"
    type = string
    default = "0.0.0.0/0"
}
variable "security_list_egress_security_rules_destination_private" {
    description = "private egress destination"
    type = string
    default = "0.0.0.0/0"
}

variable "security_list_egress_security_rules_protocol_public" {
    description = "public egress protocal"
    type = string
    default = "all"
}
variable "security_list_egress_security_rules_protocol_private" {
    description = "private egress protocal"
    type = string
    default = "all"
}

variable "security_list_display_name_public" {
    type = string
    default = "public_security_list"
}

