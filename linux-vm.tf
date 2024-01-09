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
}

resource "azurerm_subnet" "vn-subnet" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.tf-rg-philippe.name
  virtual_network_name = azurerm_virtual_network.tf-rg-philippe.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "linux-nic" {
  name                = "example-nic"
  location            = azurerm_resource_group.tf-rg-philippe.location
  resource_group_name = azurerm_resource_group.tf-rg-philippe.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.vn-subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "linux-vm" {
count = 5
 name                     = "${var.MyName}virtualmachine${count.index}"
  resource_group_name = azurerm_resource_group.tf-rg-philippe.name
  location            = azurerm_resource_group.tf-rg-philippe.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.linux-nic.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
