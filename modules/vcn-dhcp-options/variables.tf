variable "core-compartments" {}
variable "core-vcns" {}
variable "core-vcn-dhcp-options" {
  type = map(object({
    region-id                   = optional(string)
    region-name                 = optional(string)
    comp-id                     = optional(string)
    comp-name                   = string
    vcn-id                      = optional(string)
    vcn-name                    = string
    dhcp-id                     = optional(string)
    dhcp-name                   = string
    dhcp-type                   = optional(string, "DomainNameServer")
    dhcp-dns-type               = string
    dhcp-dns-server-addr        = optional(list(string), [])
    dhcp-dns-search-domain-type = optional(string, "SearchDomain")
    dhcp-dns-search-domain      = string
  }))
}
