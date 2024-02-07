# Outputs

output "public_ip_for_compute_instance" {
  value = module.compute.public_ip_for_compute_instance
}

output "instance_name" {
  value = module.compute.instance_name
}

output "instance_region" {
  value = module.compute.instance_region
}

output "instance_shape" {
  value = module.compute.instance_shape
}

output "instance_OCPUs" {
  value = module.compute.instance_OCPUs
}

output "instance_memory_in_GBs" {
  value = module.compute.instance_memory_in_GBs
}

output "time_created" {
  value = module.compute.time_created
}
