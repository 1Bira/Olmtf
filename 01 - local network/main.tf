


resource "azurerm_resource_group" "rg-local" {
    name = "rg-local"
    location = ""
}


module "vnet-reg01" {
  count = length(var.virtual_network)
  source = "./modules/network"

  naming_prefix       = var.naming_prefix
  location            = var.virtual_network[count.index].location
  resource_group_name = module.rg.name
  address_space       = var.virtual_network.address_space
  subnets = var.virtual_network.subnets
}

module "vnet-reg02" {
  source = "./modules/network"

  naming_prefix       = var.naming_prefix
  location            = var.location
  resource_group_name = module.rg.name
  address_space       = var.virtual_network.address_space
  subnets = var.virtual_network.subnets
}