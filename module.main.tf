/*Networking Module | Compartment */
module "compartments" {
  source            = "./modules/compartment"
  core-compartments = local.lst-compartments
}

/*Networking Module | Virtual Cloud Network (VCN)*/
module "vcns" {
  source            = "./modules/vcn"
  core-vcns         = local.lst-vcns
  core-compartments = module.compartments.ids
}

/*Networking Module | VCN Subnet*/
module "vcn-subnets" {
  source            = "./modules/vcn-subnet"
  core-vcns         = module.vcns.ids
  core-compartments = module.compartments.ids
  core-vcn-subnets  = local.lst-vcn-subnets
}

/*Networking Module | VCN Internet Gateway*/
module "vcn-internet-gateways" {
  source                     = "./modules/vcn-internet-gateway"
  core-vcns                  = module.vcns.ids
  core-compartments          = module.compartments.ids
  core-vcn-internet-gateways = local.lst-vcn-internet-gateways
}

/*Networking Module | VCN NAT Gateway*/
module "vcn-nat-gateways" {
  source                = "./modules/vcn-nat-gateway"
  core-vcns             = module.vcns.ids
  core-compartments     = module.compartments.ids
  core-vcn-nat-gateways = local.lst-vcn-nat-gateways
}

/*Networking Module | Cluster Placement Group*/
module "cluster-placement-groups" {
  source                        = "./modules/cluster-placement-group"
  core-compartments             = module.compartments.ids
  core-cluster-placement-groups = local.lst-cluster-placement-groups
}
