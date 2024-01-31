# VCN
module "vcn" {
  source = "./modules/vcn"
  compartment_id = var.compartment_id
}

# Private subnet
resource "oci_core_subnet" "private_subnet" {
    cidr_block = "10.0.1.0/24"
    compartment_id = var.compartment_id
    vcn_id = module.vcn.vcn_id
    display_name = "private_subnet"
    dns_label = "private"
    prohibit_public_ip_on_vnic = "true"
    security_list_ids = [oci_core_security_list.private_security_list.id]
    route_table_id = oci_core_default_route_table.route_table_service_gateway.id
}

# Public subnet
resource "oci_core_subnet" "public_subnet" {
    cidr_block = "10.0.2.0/24"
    compartment_id = var.compartment_id
    vcn_id = module.vcn.vcn_id
    display_name = "public_subnet"
    dns_label = "public"
    prohibit_public_ip_on_vnic = "false"
    route_table_id = oci_core_route_table.route_table_public.id
}

# Private security list
resource "oci_core_security_list" "private_security_list" {
    compartment_id = var.compartment_id
    vcn_id = module.vcn.vcn_id
    display_name = "private_security_list"
    ingress_security_rules {
        protocol = "all"
        source = "10.0.0.0/16"
        #tcp_options {
        #    max = var.security_list_ingress_security_rules_tcp_options_destination_port_range_max_private
        #    min = var.security_list_ingress_security_rules_tcp_options_destination_port_range_min_private
        #}
    }
    egress_security_rules {
        destination = "0.0.0.0/0"
        protocol = "all"
    }
}

resource "oci_core_default_security_list" "public_security_list" {
  manage_default_resource_id = module.vcn.default_security_list_id

  display_name = "public_security_list"
  ingress_security_rules {
      protocol = "6"
      source = "0.0.0.0/0"
      tcp_options {
          max = "22"
          min = "22"
      }
  }
  egress_security_rules {
      destination = "0.0.0.0/0"
      protocol = "all"
  }
}

resource "oci_core_internet_gateway" "internet_gateway" {
    compartment_id = var.compartment_id
    vcn_id = module.vcn.vcn_id
    display_name = "internet_gateway"
}

resource "oci_core_default_route_table" "route_table_service_gateway" {
  manage_default_resource_id = module.vcn.default_route_table_id
  display_name = "route_table_private"
  route_rules {
    network_entity_id = oci_core_nat_gateway.nat_gateway.id
    destination = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
  }
  route_rules {
    network_entity_id = oci_core_service_gateway.service_gateway.id
    destination = "all-nrt-services-in-oracle-services-network"
    destination_type = "SERVICE_CIDR_BLOCK"
  }
}

resource "oci_core_route_table" "route_table_public" {
  compartment_id = var.compartment_id
  vcn_id = module.vcn.vcn_id
  display_name = "route_table_public"
  route_rules {
      network_entity_id = oci_core_internet_gateway.internet_gateway.id
      destination = "0.0.0.0/0"
      destination_type = "CIDR_BLOCK"
  }
}

resource "oci_core_nat_gateway" "nat_gateway" {
  compartment_id = var.compartment_id
  vcn_id = module.vcn.vcn_id
  display_name = "nat_gateway"
}

resource "oci_core_service_gateway" "service_gateway" {
  compartment_id = var.compartment_id
  vcn_id = module.vcn.vcn_id
  services {
      service_id = data.oci_core_services.all_oci_services.services.0.id
  }
  display_name = "service_gateway"
}

data "oci_core_services" "all_oci_services" {
  filter {
    name   = "name"
    values = ["All .* Services In Oracle Services Network"]
    regex  = true
  }
}