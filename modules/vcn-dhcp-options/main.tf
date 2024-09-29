/*Resource creation: Virtual Cloud Network (VCN)*/
resource "oci_core_dhcp_options" "this" {
  for_each       = var.core-vcn-dhcp-options
  compartment_id = var.core-compartments[each.value.comp-name].id
  vcn_id         = var.core-vcns[each.value.vcn-name].id
  display_name   = each.value.dhcp-name

  options {
    type               = each.value.dhcp-type
    server_type        = each.value.dhcp-dns-type
    custom_dns_servers = each.value.dhcp-dns-server-addr
  }

  options {
    type                = each.value.dhcp-dns-search-domain-type
    search_domain_names = [each.value.dhcp-dns-search-domain]
  }
}
