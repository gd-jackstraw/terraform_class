resource "azurerm_network_security_group" "vn-sg1" {
  name                = "security-group"
  location            = azurerm_resource_group.tf-rg-philippe.location
  resource_group_name = azurerm_resource_group.tf-rg-philippe.name
}

locals {
  list_of_vn = ["vn1","vn2","vn3","vn4",]
}

resource "azurerm_virtual_network" "virtual-network-group" {
  for_each            = {for list in local.list_of_vn: list=>list}
  name                = "${var.prefix}list"
  location            = azurerm_resource_group.tf-rg-philippe.location
  resource_group_name = azurerm_resource_group.tf-rg-philippe.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  tags = {
    environment = "Production"
  }
}

resource "azurerm_virtual_network" "linux-vm-virtualnetwork" {
  name                = "linux-vm-vn"
  location            = azurerm_resource_group.tf-rg-philippe.location
  resource_group_name = azurerm_resource_group.tf-rg-philippe.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  tags = {
    environment = "Production"
  }
}
