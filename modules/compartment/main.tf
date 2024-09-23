/*Resource creation: Virtual Cloud Network (VCN)*/


data "oci_identity_compartments" "this_list" {
  compartment_id = var.tenancy_ocid
}

output "name" {

}


data "external" "env" {
  program = ["${path.module}/env.sh"]

}



output "env" {
  value = data.oci_identity_compartments.this_list.result
}

resource "oci_identity_compartment" "this" {
  for_each       = var.core-compartments
  compartment_id = each.value.vcn-compartment-parent-name
  // si c vide alors tenancy
  // mais sinon
  // table ["name"].id

  description = each.value.compartment-description
  name        = each.value.compartment-name
}
