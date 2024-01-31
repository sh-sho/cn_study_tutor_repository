output "bucket_name" {
  value = oci_objectstorage_bucket.test_bucket
}

output "target_compartment" {
  value = data.oci_identity_compartments.target_compartment.compartments[0].id
}
