/*Resource creation: Virtual Cloud Network (VCN)*/
resource "oci_core_clustercn" "this" {
  for_each = var.core-vcns
  //compartment_id = var.core-compartments[each.value.comp-name].id
  compartment_id = var.core-tenancy-id
  cidr_blocks    = each.value.vcn-cidr-ipv4
  display_name   = each.value.vcn-name
  dns_label      = each.value.vcn-dns-label
  is_ipv6enabled = each.value.vcn-cidr-ipv6-enable
}


resource "oci_cluster_placement_groups_cluster_placement_group" "test_cluster_placement_group" {
  #Required
  availability_domain          = var.cluster_placement_group_availability_domain
  cluster_placement_group_type = var.cluster_placement_group_cluster_placement_group_type
  compartment_id               = var.compartment_id
  description                  = var.cluster_placement_group_description
  name                         = var.cluster_placement_group_name

  #Optional
  capabilities {
    #Required
    items {
      #Required
      name    = var.cluster_placement_group_capabilities_items_name
      service = var.cluster_placement_group_capabilities_items_service
    }
  }
  defined_tags  = { "foo-namespace.bar-key" = "value" }
  freeform_tags = { "bar-key" = "value" }
  opc_dry_run   = var.cluster_placement_group_opc_dry_run
  placement_instruction {
    #Required
    type  = var.cluster_placement_group_placement_instruction_type
    value = var.cluster_placement_group_placement_instruction_value
  }
}
