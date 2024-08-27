resource "azurerm_network_interface" "nic" {
  count = var.instances

  name ="${var.name}-nic-${count.index}"
  location = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name = "default"
    subnet_id = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    private_ip_address_version = "IPv4"
  }

}

resource "azurerm_linux_virtual_machine" "linux_vm" {
  count = var.instances
  name = "${var.name}-vm-{count.index}"
  resource_group_name = var.resource_group_name
  location = var.location
  size = var.size

  admin_username = var.credentials.username
  admin_password = var.credentials.username
  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.nic[count.index].id
  ]

  os_disk {
    caching = var.os_disk.caching
    storage_account_type = var.os_disk.storage_account_type
  }

  source_image_reference {
    publisher = var.image.publisher
    offer = var.image.offer
    sku = var.image.sku
    version = var.image.version
  }
  
}