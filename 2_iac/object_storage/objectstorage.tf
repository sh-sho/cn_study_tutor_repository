resource "oci_objectstorage_bucket" "test_bucket" {
  compartment_id = data.oci_identity_compartments.target_compartment.compartments[0].id
  name = var.bucket_name
  namespace = var.bucket_namespace
  access_type = var.access_type
}
