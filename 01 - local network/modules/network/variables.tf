variable "naming_prefix" {
  description = "[required] A prefix used to garante resource names"
  type = string
}

variable "location" {
  description = "[required] The azure region where the resource will be deployed"
  type = string
}

variable "resource_group_name" {
    description = "[required]The name of resource group where the resource will be created"
    type= string   
}

variable "address_space" {
    description = "[required] The Ip address range allocated for the virtual network"
    type = string
}

variable "subnets" {
    description = "[required] The list of object definig the properties for each subnet"
    type = list(object({
      name = string
      cidr = string
      endpoint_type = string
    }))
}