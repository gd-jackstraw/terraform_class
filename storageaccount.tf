
resource "azurerm_storage_account" "tf-storageaccount" {
 // count                 = length(var.Storage_list)
  // name                  = var.Storage_list[count.index].name
  for_each                 = toset(var.Storage_list)
  name                     =each.value
  resource_group_name      = azurerm_resource_group.tf-rg-philippe.name
  location                 = azurerm_resource_group.tf-rg-philippe.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  cross_tenant_replication_enabled =var.cross_tenant_replication

  tags = {
    environment = "staging"
  }
}
