variable "core-compartments" {}
variable "core-vcns" {
  type = map(object({
    region-id            = optional(string)
    comp-name            = string
    vcn-name             = string
    vcn-dns-label        = optional(string)
    vcn-cidr-ipv4        = list(string)
    vcn-cidr-ipv6-enable = optional(bool, false)
  }))
}
