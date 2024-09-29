variable "core-compartments" {}
variable "core-customer-premises-equipments" {
  type = map(object({
    region-id           = optional(string)
    region-name         = optional(string)
    comp-id             = optional(string)
    comp-name           = string
    cpe-id              = optional(string)
    cpe-name            = optional(string)
    cpe-ip-address      = string
    cpe-ipsec-fc-enable = optional(bool, false)
    cpe-device-id       = string
    cpe-vendor-name     = optional(string)
    cpe-platform-name   = optional(string)
  }))
}
