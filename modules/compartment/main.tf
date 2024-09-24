/*Resource creation: Compartment*/
resource "oci_identity_compartment" "this" {
  for_each       = var.core-compartments
  compartment_id = var.core-tenancy-id
  name           = each.value.comp-name
  description    = each.value.comp-description
  enable_delete  = true
}
