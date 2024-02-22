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
    source_ocid = "ocid1.image.oc1.phx.aaaaaaaa6dxlvblwz5msd3cqlmuy4inpytvsbjwyecpstlvak3llgyt4oqba"
    wordpress_image_url = "wordpress:latest"
    mysql_image_url = "mysql:5.7"
    container_instance_shape = "CI.Standard.E4.Flex"
}

resource "oci_container_instances_container_instance" "mysql_container_instance" {
    availability_domain = local.availability_domain_name
    compartment_id = var.compartment_id
    display_name = var.container_instance_display_name
    
    containers {
        image_url = local.wordpress_image_url
        display_name = var.wordpress_display_name
        environment_variables = {
            "WORDPRESS_DB_HOST" = "127.0.0.1",
            "WORDPRESS_DB_USER" = var.wordpress_db_user,
            "WORDPRESS_DB_PASSWORD" = var.wordpress_db_password,
            "WORDPRESS_DB_NAME" = var.wordpress_db_name
        }
    }

    containers {
        image_url = local.mysql_image_url
        display_name = var.mysql_display_name
        environment_variables = {
            "MYSQL_ROOT_PASSWORD" = var.mysql_root_password,
            "MYSQL_USER" = var.mysql_user,
            "MYSQL_PASSWORD" = var.mysql_password,
            "MYSQL_DATABASE" = var.mysql_database
        }
    }

    container_restart_policy = "ALWAYS"
    shape = local.container_instance_shape
    shape_config {
        ocpus = 1
    }
    vnics {
        subnet_id = var.subnet_ocid
        display_name = var.display_vnic_name
    }
    volumes {
        name = var.mysql_volumes_name
        volume_type = "CONFIGFILE"
    }
}
