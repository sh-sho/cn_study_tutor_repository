# Outputs for compute instance

output "public_ip_for_compute_instance" {
  value = oci_core_instance.ubuntu_instance.public_ip
}

output "instance_name" {
  value = oci_core_instance.ubuntu_instance.display_name
}

output "instance_ocid" {
  value = oci_core_instance.ubuntu_instance.id
}

output "instance_region" {
  value = oci_core_instance.ubuntu_instance.region
}

output "instance_shape" {
  value = oci_core_instance.ubuntu_instance.shape
}

output "instance_state" {
  value = oci_core_instance.ubuntu_instance.state
}

output "instance_OCPUs" {
  value = oci_core_instance.ubuntu_instance.shape_config[0].ocpus
}

output "instance_memory_in_GBs" {
  value = oci_core_instance.ubuntu_instance.shape_config[0].memory_in_gbs
}

output "time_created" {
  value = oci_core_instance.ubuntu_instance.time_created
}
