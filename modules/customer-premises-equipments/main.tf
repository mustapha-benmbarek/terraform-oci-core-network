/*Resource creation: Customer-Premises Equipment*/
resource "oci_core_cpe" "this" {
  for_each            = var.core-customer-premises-equipments
  compartment_id      = var.core-compartments[each.value.comp-name].id
  ip_address          = each.value.cpe-ip-address
  display_name        = each.value.cpe-name
  is_private          = each.value.cpe-ipsec-fc-enabled
  cpe_device_shape_id = each.value.cpe-device-id
}
