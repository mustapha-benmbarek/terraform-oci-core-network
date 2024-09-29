
/*Data loading...*/
locals {

  json-compartments = try(jsondecode(file(var.json-compartments)), [])


  json-vcns                  = try(jsondecode(file(var.json-vcns)), [])
  json-vcn-subnets           = try(jsondecode(file(var.json-vcn-subnets)), [])
  json-vcn-internet-gateways = try(jsondecode(file(var.json-vcn-internet-gateways)), [])
  json-vcn-nat-gateways      = try(jsondecode(file(var.json-vcn-nat-gateways)), [])
  json-vcn-service-gateways  = try(jsondecode(file(var.json-vcn-service-gateways)), [])
  json-vcn-dhcp-options      = try(jsondecode(file(var.json-vcn-dhcp-options)), [])

  json-vcn-route-tables   = try(jsondecode(file(var.json-vcn-route-tables)), [])
  json-vcn-security-lists = try(jsondecode(file(var.json-vcn-security-lists)), [])

  json-cluster-placement-groups     = try(jsondecode(file(var.json-cluster-placement-groups)), [])
  json-customer-premises-equipments = try(jsondecode(file(var.json-customer-premises-equipments)), [])
}

/*Data decoding...*/
locals {

  lst-compartments = try({ for obj in local.json-compartments.data : obj.comp-name => obj }, tomap({}))

  lst-vcns                  = try({ for obj in local.json-vcns.data : obj.vcn-name => obj }, tomap({}))
  lst-vcn-subnets           = try({ for obj in local.json-vcn-subnets.data : obj.sn-name => obj }, tomap({}))
  lst-vcn-internet-gateways = try({ for obj in local.json-vcn-internet-gateways.data : obj.igw-name => obj }, tomap({}))
  lst-vcn-nat-gateways      = try({ for obj in local.json-vcn-nat-gateways.data : obj.ngw-name => obj }, tomap({}))
  lst-vcn-service-gateways  = try({ for obj in local.json-vcn-internet-gateways.data : obj.sgw-name => obj }, tomap({}))
  lst-vcn-dhcp-options      = try({ for obj in local.json-vcn-dhcp-options.data : obj.dhcp-name => obj }, tomap({}))


  lst-vcn-route-tables   = try({ for obj in local.json-vcn-route-tables.data : obj.rtb-name => obj }, tomap({}))
  lst-vcn-security-lists = try({ for obj in local.json-vcn-security-lists.data : obj.sl-name => obj }, tomap({}))

  lst-cluster-placement-groups = try({ for obj in local.json-cluster-placement-groups.data : obj.cpg-name => obj }, tomap({}))

  lst-customer-premises-equipments = try({ for obj in local.json-customer-premises-equipments.data : obj.cpe-name => obj }, tomap({}))
}

