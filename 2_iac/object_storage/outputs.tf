output "bucket_name" {
  value = oci_objectstorage_bucket.test_bucket.name
}

output "bucket_namespace" {
  value = oci_objectstorage_bucket.test_bucket.namespace
}

output "bucket_accessType" {
  value = oci_objectstorage_bucket.test_bucket.access_type
}

output "bucket_bucket_id" {
  value = oci_objectstorage_bucket.test_bucket.bucket_id
}

output "bucket_compartment_id" {
  value = oci_objectstorage_bucket.test_bucket.compartment_id
}

output "bucket_created_by" {
  value = oci_objectstorage_bucket.test_bucket.created_by
}

output "bucket_storage_tier" {
  value = oci_objectstorage_bucket.test_bucket.storage_tier
}

output "target_compartment" {
  value = data.oci_identity_compartments.target_compartment.compartments[0].id
}
