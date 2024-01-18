#module for resource group

variable "resource_group_name" {
  description = "The name of the resource group"
}

variable "location" {
  description = "The Azure region where the storage account will be created"
  default     = "eastus"
}
resource "azurerm_resource_group" "module-example-rg" {
    name                     = var.resource_group_name
    location                 = var.location

}

output "resource_group_name" {
  value = azurerm_resource_group.module-example-rg.name
}
