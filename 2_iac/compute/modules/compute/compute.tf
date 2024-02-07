terraform {
  required_providers {
    oci = {
        source = "oracle/oci"
        version = ">= 5.0.0"
    }
  }
}

data "oci_identity_availability_domains" "ads" {
    compartment_id = "${var.compartment_id}"
}

locals {
    availability_domain_name = data.oci_identity_availability_domains.ads.availability_domains[0].name
}

# compute
resource "oci_core_instance" "ubuntu_instance" {
    availability_domain = "${local.availability_domain_name}"
    compartment_id = "${var.compartment_id}"
    shape = "VM.Standard.E4.Flex"
    create_vnic_details {
        display_name = "${var.display_vnic_name}"
        assign_public_ip = true
        subnet_id = "${var.subnet_ocid}"
    }
    display_name = "${var.display_instance_name}"
    
    shape_config {
        baseline_ocpu_utilization = "BASELINE_1_2"
        memory_in_gbs = 16
        ocpus = 1
    }
    source_details {
        source_id = "${var.source_ocid}"
        source_type = "image"
        boot_volume_size_in_gbs = 100
    }
    preserve_boot_volume = false
    metadata = {
        ssh_authorized_keys = file("${var.public_ssh_key_path}")

        user_data = "${base64encode(file("./modules/compute/instance_init/install_init.yaml"))}"
    }
}
