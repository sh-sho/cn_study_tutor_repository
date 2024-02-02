terraform {
  required_providers {
    oci = {
        source = "oracle/oci"
        version = ">= 5.0.0"
    }
  }
}

# VCN
resource "oci_core_vcn" "test_vcn" {
    compartment_id = var.compartment_id
    cidr_blocks = var.vcn_cidr_blocks
    display_name = var.vcn_display_name
    dns_label = var.vcn_dns_label
}

# Internet Gateway
resource "oci_core_internet_gateway" "test_internet_gateway" {
    compartment_id = var.compartment_id
    vcn_id = oci_core_vcn.test_vcn.id
    enabled = true
    display_name = var.internet_gateway_display_name
}

# Route Table (default route table)
resource "oci_core_route_table" "default_route_table" {
    compartment_id = var.compartment_id
    vcn_id = oci_core_vcn.test_vcn.id
    display_name = var.route_table_display_name
    route_rules {
        network_entity_id = oci_core_internet_gateway.test_internet_gateway.id
        destination = var.default_route_table_route_rules_destination
        destination_type = var.default_route_table_route_rules_destination_type
    }
}

# Nat Gateway
resource "oci_core_nat_gateway" "test_nat_gateway" {
    compartment_id = var.compartment_id
    vcn_id = oci_core_vcn.test_vcn.id
    display_name = var.nat_gateway_display_name
}

# Service Gateway
resource "oci_core_service_gateway" "test_service_gateway" {
    compartment_id = var.compartment_id
    services {
        service_id = data.oci_core_services.all_oci_services.services.0.id
    }
    vcn_id = oci_core_vcn.test_vcn.id
    display_name = var.service_gateway_display_name
}

data "oci_core_services" "all_oci_services" {
  filter {
    name   = "name"
    values = ["All .* Services In Oracle Services Network"]
    regex  = true
  }
}

# Route Table (private route table)
resource "oci_core_route_table" "private_route_table" {
    compartment_id = var.compartment_id
    vcn_id = oci_core_vcn.test_vcn.id
    display_name = var.private_subnet_route_table_display_name
    route_rules {
        network_entity_id = oci_core_nat_gateway.test_nat_gateway.id
        destination = var.private_route_table_route_rules_destination
        destination_type = var.private_route_table_route_rules_destination_type
    }
    route_rules {
        network_entity_id = oci_core_service_gateway.test_service_gateway.id
        destination = "all-phx-services-in-oracle-services-network"
        destination_type = var.private_route_table_route_rules_destination_service_gateway_type
    }
}

# Security List(Public)
resource "oci_core_security_list" "public_security_list" {
    compartment_id = var.compartment_id
    vcn_id = oci_core_vcn.test_vcn.id

    display_name = var.public_security_list_display_name
    egress_security_rules {
        destination = var.public_security_list_egress_security_rules_destination
        protocol = var.public_security_list_egress_security_rules_protocol
    }
    ingress_security_rules {
        protocol = var.public_security_list_ingress_security_rules_protocol
        source = var.public_security_list_ingress_security_rules_source

        tcp_options {
            max = var.public_security_list_ingress_security_rules_tcp_options_destination_port_range_max
            min = var.public_security_list_ingress_security_rules_tcp_options_destination_port_range_min
        }
    }
    ingress_security_rules {
        protocol = var.public_security_list_ingress_security_rules_protocol_2
        source = var.public_security_list_ingress_security_rules_source_2

        icmp_options {
            type = var.public_security_list_ingress_security_rules_icmp_options_type_2
            code = var.public_security_list_ingress_security_rules_icmp_options_code_2
            }
    }
    ingress_security_rules {
        protocol = var.public_security_list_ingress_security_rules_protocol_3
        source = var.public_security_list_ingress_security_rules_source_3

        icmp_options {
            #Required
            type = var.public_security_list_ingress_security_rules_icmp_options_type_3
            }
    }
}

# Securiy List(Private)
resource "oci_core_security_list" "private_security_list" {
    compartment_id = var.compartment_id
    vcn_id = oci_core_vcn.test_vcn.id

    display_name = var.private_security_list_display_name
    egress_security_rules {
        destination = var.private_security_list_egress_security_rules_destination
        protocol = var.private_security_list_egress_security_rules_protocol
    }
    ingress_security_rules {
        protocol = var.private_security_list_ingress_security_rules_protocol
        source = var.private_security_list_ingress_security_rules_source

        tcp_options {
            max = var.private_security_list_ingress_security_rules_tcp_options_destination_port_range_max
            min = var.private_security_list_ingress_security_rules_tcp_options_destination_port_range_min
        }
    }
    ingress_security_rules {
        protocol = var.private_security_list_ingress_security_rules_protocol_2
        source = var.private_security_list_ingress_security_rules_source_2

        icmp_options {
            type = var.private_security_list_ingress_security_rules_icmp_options_type_2
            code = var.private_security_list_ingress_security_rules_icmp_options_code_2
            }
    }
    ingress_security_rules {
        protocol = var.private_security_list_ingress_security_rules_protocol_3
        source = var.private_security_list_ingress_security_rules_source_3

        icmp_options {
            type = var.private_security_list_ingress_security_rules_icmp_options_type_3
            }
    }
}

# Subnet (Public)
resource "oci_core_subnet" "public_subnet" {
    cidr_block = var.public_subnet_cidr_block
    compartment_id = var.compartment_id
    vcn_id = oci_core_vcn.test_vcn.id

    # dhcp_options_id = oci_core_dhcp_options.test_dhcp_options.id
    display_name = var.public_subnet_display_name
    dns_label = var.public_subnet_dns_label
    prohibit_internet_ingress = false
    prohibit_public_ip_on_vnic = false
    route_table_id = oci_core_route_table.default_route_table.id
    security_list_ids = [oci_core_security_list.public_security_list.id]
}

# Subnet (Private)
resource "oci_core_subnet" "private_subnet" {
    #Required
    cidr_block = var.private_subnet_cidr_block
    compartment_id = var.compartment_id
    vcn_id = oci_core_vcn.test_vcn.id

    #Optional
    # dhcp_options_id = oci_core_dhcp_options.test_dhcp_options.id
    display_name = var.private_subnet_display_name
    dns_label = var.private_subnet_dns_label
    prohibit_public_ip_on_vnic = true
    route_table_id = oci_core_route_table.private_route_table.id
}




