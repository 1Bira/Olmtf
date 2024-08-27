variable "location" {
  description = "Location of the resources"
  type        = string
}

variable "naming_prefix" {
  description = "Prefix to be used in the naming of the resources."
  type        = string
}

variable "environment" {
  description = "Environment to be used in the naming of the resources"
  type = string
}

variable "virtual_network" {
  description = "Object containing the virtual network and subnets properties."
  type = list(object({
    address_space = string
    subnets = list(object({
      name = string
      cidr = string
      endpoint_type = optional(string, null)
    }))
  }))
}
