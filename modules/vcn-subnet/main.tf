
/*Resource creation: Subnet*/
resource "oci_core_vcn" "this" {
  for_each = var.core-vcns
  //compartment_id = var.core-compartments[each.value.comp-name].id
  compartment_id = var.core-tenancy-id
  cidr_blocks    = each.value.vcn-cidr-ipv4
  display_name   = each.value.vcn-name
  dns_label      = each.value.vcn-dns-label
  is_ipv6enabled = each.value.vcn-cidr-ipv6-enable
}


resource "oci_core_subnet" "this" {
  for_each = var.core-vcn-subnets
  //compartment_id = var.core-compartments[each.value.comp-name].id  
  compartment_id = "ocid1.tenancy.oc1..aaaaaaaab4mgylvi6qccw4zy4yqoaf5iba5hdoirzxjz5btv7gdksxcp6xoq"
  vcn_id         = var.core-vcns[each.value.vcn-name].id

  cidr_block = each.value.vcn-dns-label


  #Optional
  availability_domain        = var.subnet_availability_domain
  defined_tags               = { "Operations.CostCenter" = "42" }
  dhcp_options_id            = oci_core_dhcp_options.test_dhcp_options.id
  display_name               = var.subnet_display_name
  dns_label                  = var.subnet_dns_label
  freeform_tags              = { "Department" = "Finance" }
  ipv6cidr_block             = var.subnet_ipv6cidr_block
  ipv6cidr_blocks            = var.subnet_ipv6cidr_blocks
  prohibit_internet_ingress  = var.subnet_prohibit_internet_ingress
  prohibit_public_ip_on_vnic = var.subnet_prohibit_public_ip_on_vnic
  route_table_id             = oci_core_route_table.test_route_table.id
  security_list_ids          = var.subnet_security_list_ids
}
