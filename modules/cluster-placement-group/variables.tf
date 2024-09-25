variable "core-compartments" {}
variable "core-cluster-placement-groups" {
  type = map(object({
    region-id = optional(string)
    comp-name = string
  }))
}
