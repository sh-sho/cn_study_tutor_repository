module "vcn" {
  source = "./modules/vcn"

  compartment_id = var.compartment_id
  vcn_display_name = var.vcn_display_name
}

module "compute" {
  source = "./modules/compute"

  compartment_id = var.compartment_id
  subnet_ocid = module.vcn.public_subnet_id
  display_vnic_name = var.display_vnic_name
  display_instance_name = var.display_instance_name
}
