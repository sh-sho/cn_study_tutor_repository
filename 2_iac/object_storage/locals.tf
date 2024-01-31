locals {
  target_compartment_id = data.oci_identity_compartments.target_compartment.compartments[0].id
}
