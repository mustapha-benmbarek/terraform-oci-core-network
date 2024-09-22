/*Data loading...*/
locals {
  json-vcns                  = try(jsondecode(file(var.json-vcns)), [])
  json-vcn-subnets           = try(jsondecode(file(var.json-vcn-subnets)), [])
  json-vcn-internet-gateways = try(jsondecode(file(var.json-vcn-internet-gateways)), [])
  json-vcn-nat-gateways      = try(jsondecode(file(var.json-vcn-nat-gateways)), [])
  json-vcn-service-gateways  = try(jsondecode(file(var.json-vcn-service-gateways)), [])
  json-vcn-route-tables      = try(jsondecode(file(var.json-vcn-route-tables)), [])
  json-vcn-security-lists    = try(jsondecode(file(var.json-vcn-security-lists)), [])
}

/*Data decoding...*/
locals {
  lst-vcns                   = try({ for obj in local.json-vcns.data : obj.name => obj }, tomap({}))
  lst-vcn-subnets            = try({ for obj in local.json-vcn-subnets.data : obj.name => obj }, tomap({}))
  lst-vcn-internet-gateways  = try({ for obj in local.json-vcn-internet-gateways.data : obj.name => obj }, tomap({}))
  lst-vcn-nat-gateways       = try({ for obj in local.json-vcn-nat-gateways.data : obj.name => obj }, tomap({}))
  lst-vcn-service-gateways   = try({ for obj in local.json-vcn-internet-gateways.data : obj.name => obj }, tomap({}))
  lst-vcn-route-tables       = try({ for obj in local.json-vcn-route-tables.data : obj.name => obj }, tomap({}))
  lst-vcn-vcn-security-lists = try({ for obj in local.json-vcn-security-lists.data : obj.name => obj }, tomap({}))
}
