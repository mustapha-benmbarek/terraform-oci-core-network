/*Networking Module | Compartment */
module "compartments" {
  source            = "./modules/compartment"
  core-compartments = local.lst-compartments
}

/*Networking Module | Virtual Cloud Network (VCN)*/
module "vcns" {
  source    = "./modules/vcn"
  core-vcns = local.lst-vcns
}

/*Networking Module | VCN Subnet*/
//module "vcn-subnets" {
//source           = "./modules/vcn-subnet"
//core-vcns        = module.vcns.ids
//core-vcn-subnets = local.lst-vcn-subnets
//}

/*Networking Module | VCN Internet Gateway*/
//module "vcn-internet-gateways" {
//source                     = "./modules/vcn-internet-gateway"
//core-vcn-internet-gateways = local.lst-vcn-internet-gateways
//}
