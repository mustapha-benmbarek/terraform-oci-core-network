/*Resource creation: Virtual Cloud Network (VCN)*/
resource "oci_core_vcn" "this" {
  for_each       = var.core-vcns
  compartment_id = each.value.vcn-compartment-name
  cidr_blocks    = each.value.vcn-cidr-ipv4
  display_name   = each.value.vcn-name
  dns_label      = each.value.vcn-dns-label
  is_ipv6enabled = each.value.vcn-cidr-ipv6-enable
}
