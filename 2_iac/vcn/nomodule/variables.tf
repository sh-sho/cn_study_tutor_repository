		  
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


variable "cidr_block_private" {
    description = "private subet cider block"
    type = string
    default = "10.0.1.0/24"
}
variable "subnet_display_name_private" {
    description = "private subet display name"
    type = string
    default = "private_subnet"
}
variable "subnet_dns_label_private" {
    description = "private subet dns label"
    type = string
    default = "private"
}

			   
variable "cidr_block_public" {
    description = "public subet cider block"
    type = string
    default = "10.0.2.0/24"
}
variable "subnet_display_name_public" {
    description = "public subet display name"
    type = string
    default = "public_subnet"
}
variable "subnet_dns_label_public" {
    description = "public subet dns label"
    type = string
    default = "public"
}

			   
variable "security_list_display_name_private" {
    description = "private security list display name"
    type = string
    default = "private_security_list"
}
variable "security_list_display_name_public" {
    description = "public security list display name"
    type = string
    default = "public_security_list"
}

variable "security_list_ingress_security_rules_protocol_private" {
    description = "private ingress protocol. all, ICMP (1), TCP (6), UDP (17), and ICMPv6 (58)"
    type = string
    default = "6"
}
variable "security_list_ingress_security_rules_protocol_public" {
    description = "public ingress protocol. all, ICMP (1), TCP (6), UDP (17), and ICMPv6 (58)"
    type = string
    default = "6"
}
variable "security_list_ingress_security_rules_source_private" {
    description = "private ingress souce cidr block"
    type = string
    default = "10.0.0.0/16"
}
variable "security_list_ingress_security_rules_source_public" {
    description = "public ingress souce cidr block"
    type = string
    default = "0.0.0.0/0"
}

variable "security_list_ingress_security_rules_tcp_options_destination_port_range_min_private" {
    description = "privagte ingress min tcp port"
    type = string
    default = "443"
}
variable "security_list_ingress_security_rules_tcp_options_destination_port_range_max_private" {
    description = "privagte ingress max tcp port"
    type = string
    default = "443"
}

variable "security_list_ingress_security_rules_tcp_options_destination_port_range_min_public" {
    description = "public ingress min tcp port"
    type = string
    default = "22"
}
variable "security_list_ingress_security_rules_tcp_options_destination_port_range_max_public" {
    description = "public ingress max tcp port"
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
    description = "public egress protocal. all, ICMP (1), TCP (6), UDP (17), and ICMPv6 (58)"
    type = string
    default = "all"
}
variable "security_list_egress_security_rules_protocol_private" {
    description = "private egress protocal. all, ICMP (1), TCP (6), UDP (17), and ICMPv6 (58)"
    type = string
    default = "all"
}
