/*Resource creation: Subnet*/
resource "oci_core_subnet" "this" {
  for_each            = var.core-vcn-subnets
  compartment_id      = var.core-compartments[each.value.comp-name].id
  vcn_id              = var.core-vcns[each.value.vcn-name].id
  display_name        = each.value.sn-name
  cidr_block          = each.value.sn-cidr-ipv4
  availability_domain = each.value.sn-availability-domain
  dns_label           = each.value.sn-dns-label
}
