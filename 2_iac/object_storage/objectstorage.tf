resource "oci_objectstorage_bucket" "test_bucket" {
  compartment_id = local.target_compartment_id
  name = var.bucket_name
  namespace = var.bucket_namespace
  access_type = var.access_type
}
