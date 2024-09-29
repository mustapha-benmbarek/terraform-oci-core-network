/*Initialization...*/

variable "TENANCY_OCID" {}

variable "json-compartments" { default = "" }

variable "json-vcns" { default = "" }
variable "json-vcn-subnets" { default = "" }
variable "json-vcn-internet-gateways" { default = "" }
variable "json-vcn-nat-gateways" { default = "" }
variable "json-vcn-service-gateways" { default = "" }
variable "json-vcn-dhcp-options" { default = "" }

variable "json-vcn-route-tables" { default = "" }
variable "json-vcn-security-lists" { default = "" }


variable "json-cluster-placement-groups" { default = "" }

variable "json-customer-premises-equipments" { default = "" }
