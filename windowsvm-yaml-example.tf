locals{
 windowsvm =[for f in fileset("${path.module}/configs/windows_vm_configs", "[^_]*.yaml") : yamldecode(file("${path.module}/configs/windows_vm_configs/${f}"))]
 windowsvm_list = flatten([
    for info in local.windowsvm : [
      for windows_vm in try(info.listofwindowsvm, []) :{
        name=windows_vm.name
        admin_username=windows_vm.admin_username
        admin_password=windows_vm.admin_password
      }
    ]
  ])
}

resource "azurerm_network_interface" "windows-nic" {
  name                = "windows-vm-nic"
  location            = azurerm_resource_group.tf-rg-philippe.location
  resource_group_name = azurerm_resource_group.tf-rg-philippe.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.vn-subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}



resource "azurerm_windows_virtual_machine" "windows-vm-machine" {
  for_each            ={for wvm in local.windowsvm_list: "${wvm.name}"=>wvm }
  name                = each.value.name
  resource_group_name = azurerm_resource_group.tf-rg-philippe.name
  location            = azurerm_resource_group.tf-rg-philippe.location
  size                = "Standard_F2"
  admin_username      = each.value.admin_username
  admin_password      = each.value.admin_password
  network_interface_ids = [
    azurerm_network_interface.linux-nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}

output "windows_vm_output_yaml" {
 value=local.windowsvm_list
}
