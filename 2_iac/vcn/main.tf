resource "oci_core_vcn" "generated_oci_core_vcn" {
	cidr_blocks = [var.cidr_blocks]
	compartment_id = var.compartment_id
	display_name = var.display_name
	dns_label = var.dns_label
	is_ipv6enabled = "false"
}

resource "oci_core_subnet" "private_subnet" {
    cidr_block = var.cidr_block_private
    compartment_id = var.compartment_id
    vcn_id = oci_core_vcn.generated_oci_core_vcn.id
    display_name = var.subnet_display_name_private
    dns_label = var.subnet_dns_label_private
    prohibit_public_ip_on_vnic = "true"
    security_list_ids = [oci_core_security_list.private_security_list.id]
    route_table_id = oci_core_default_route_table.default_route_table.id
}

resource "oci_core_subnet" "public_subnet" {
    cidr_block = var.cidr_block_public
    compartment_id = var.compartment_id
    vcn_id = oci_core_vcn.generated_oci_core_vcn.id
    display_name = var.subnet_display_name_public
    dns_label = var.subnet_dns_label_public
    prohibit_public_ip_on_vnic = "false"
    route_table_id = oci_core_route_table.route_table_public.id
}

resource "oci_core_security_list" "private_security_list" {
    compartment_id = var.compartment_id
    vcn_id = oci_core_vcn.generated_oci_core_vcn.id
    display_name = var.security_list_display_name_1
    ingress_security_rules {
        protocol = var.security_list_ingress_security_rules_protocol_1
        source = var.security_list_ingress_security_rules_source_1
        tcp_options {
            max = var.security_list_ingress_security_rules_tcp_options_destination_port_range_max_1
            min = var.security_list_ingress_security_rules_tcp_options_destination_port_range_min_1
        }
    }
    egress_security_rules {
        destination = var.security_list_egress_security_rules_destination_1
        protocol = var.security_list_egress_security_rules_protocol_1
    }
}

resource "oci_core_default_security_list" "default_security_list" {
  manage_default_resource_id = oci_core_vcn.generated_oci_core_vcn.default_security_list_id

  display_name = var.security_list_display_name_default
  ingress_security_rules {
      protocol = var.security_list_ingress_security_rules_protocol_1
      source = var.security_list_ingress_security_rules_source_1
      tcp_options {
          max = var.security_list_ingress_security_rules_tcp_options_destination_port_range_max_1
          min = var.security_list_ingress_security_rules_tcp_options_destination_port_range_min_1
      }
  }
  egress_security_rules {
      destination = var.security_list_egress_security_rules_destination_1
      protocol = var.security_list_egress_security_rules_protocol_1
  }
}

resource "oci_core_internet_gateway" "internet_gateway" {
    compartment_id = var.compartment_id
    vcn_id = oci_core_vcn.generated_oci_core_vcn.id
    display_name = var.internet_gateway_display_name
}

resource "oci_core_default_route_table" "default_route_table" {
  manage_default_resource_id = oci_core_vcn.generated_oci_core_vcn.default_route_table_id
  display_name = var.route_table_display_name
  route_rules {
    network_entity_id = oci_core_nat_gateway.nat_gateway.id
    destination = var.route_table_route_rules_destination
    destination_type = var.route_table_route_rules_destination_type
  }
  route_rules {
    network_entity_id = oci_core_service_gateway.service_gateway.id
    destination = "all-nrt-services-in-oracle-services-network"
    destination_type = var.route_table_route_rules_destination_service_gateway_type
  }
}

resource "oci_core_route_table" "route_table_public" {
  compartment_id = var.compartment_id
  vcn_id = oci_core_vcn.generated_oci_core_vcn.id
  display_name = var.route_table_display_name_1
  route_rules {
      network_entity_id = oci_core_internet_gateway.internet_gateway.id
      destination = var.route_table_route_rules_destination
      destination_type = var.route_table_route_rules_destination_type
  }
}

resource "oci_core_nat_gateway" "nat_gateway" {
  compartment_id = var.compartment_id
  vcn_id = oci_core_vcn.generated_oci_core_vcn.id
  display_name = var.nat_gateway_display_name
}

resource "oci_core_service_gateway" "service_gateway" {
  compartment_id = var.compartment_id
  vcn_id = oci_core_vcn.generated_oci_core_vcn.id
  services {
      service_id = data.oci_core_services.all_oci_services.services.0.id
  }
  display_name = var.service_gateway_display_name
}

data "oci_core_services" "all_oci_services" {
  filter {
    name   = "name"
    values = ["All .* Services In Oracle Services Network"]
    regex  = true
  }
}