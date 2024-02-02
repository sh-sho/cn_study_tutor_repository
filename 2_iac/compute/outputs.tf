# Outputs

output "public-ip-for-compute-instance" {
  value = module.compute.public-ip-for-compute-instance
}

output "instance-name" {
  value = module.compute.instance-name
}

output "instance-region" {
  value = module.compute.instance-region
}

output "instance-shape" {
  value = module.compute.instance-shape
}

output "instance-OCPUs" {
  value = module.compute.instance-OCPUs
}

output "instance-memory-in-GBs" {
  value = module.compute.instance-memory-in-GBs
}

output "time-created" {
  value = module.compute.time-created
}
