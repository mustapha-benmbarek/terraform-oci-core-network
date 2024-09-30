/*Networking Module | Virtual Cloud Network (VCN)*/
module "vcns" {
  source            = "./modules/vcn"
  core-compartments = var.data-compartments
  core-vcns         = local.lst-vcns
}

/*Networking Module | VCN Subnet*/
module "vcn-subnets" {
  source            = "./modules/vcn-subnet"
  core-compartments = var.data-compartments
  core-vcns         = module.vcns.ids
  core-vcn-subnets  = local.lst-vcn-subnets

}

/*Networking Module | VCN Internet Gateway*/
module "vcn-internet-gateways" {
  source                     = "./modules/vcn-internet-gateway"
  core-compartments          = var.data-compartments
  core-vcns                  = module.vcns.ids
  core-vcn-internet-gateways = local.lst-vcn-internet-gateways

}

/*Networking Module | VCN NAT Gateway
module "vcn-nat-gateways" {
  source                = "./modules/vcn-nat-gateway"
    core-compartments = var.data-compartments
  core-vcns             = module.vcns.ids
  core-vcn-nat-gateways = local.lst-vcn-nat-gateways

}*/

/*Networking Module | VCN DHCP Options*/
module "vcn-dhcp-options" {
  source                = "./modules/vcn-dhcp-options"
  core-compartments     = var.data-compartments
  core-vcns             = module.vcns.ids
  core-vcn-dhcp-options = local.lst-vcn-dhcp-options
}


/*Networking Module | Cluster Placement Group
module "cluster-placement-groups" {
  source                        = "./modules/cluster-placement-group"
    core-compartments = var.data-compartments
  core-cluster-placement-groups = local.lst-cluster-placement-groups

}*/

/*Networking Module | Customer-Premises Equipment
module "customer-premises-equipments" {
  source                            = "./modules/customer-premises-equipment"
    core-compartments = var.data-compartments
  core-customer-premises-equipments = local.lst-customer-premises-equipments
}*/
