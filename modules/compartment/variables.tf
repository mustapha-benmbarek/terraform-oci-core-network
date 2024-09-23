variable "core-compartments" {
  type = map(object({
    vcn-region-id        = optional(string)
    vcn-compartment-name = string
    vcn-name             = string
    vcn-dns-label        = optional(string)
    vcn-cidr-ipv4        = list(string)
    vcn-cidr-ipv6-enable = optional(bool, false)
  }))
}

variable "tenancy_ocid" {
  type = string
}

