
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

locals{
 storageaccounts=[for f in fileset("${path.module}/configs/storageaccount_configs", "[^_]*.yaml") : yamldecode(file("${path.module}/configs/storageaccount_configs/${f}"))]
 storageaccountlist = flatten([
    for info in local.storageaccounts : [
      for storageaccount in try(info.listofstorageaccount, []) :{
        name=storageaccount.name
        account_tier=storageaccount.account_tier
        account_replication_type=storageaccount.account_replication_type    
        access_tier=storageaccount.access_tier
        cross_tenant_replication_enabled=storageaccount.cross_tenant_replication_enabled
      }
    ]
])
}

output "storageaccount_list_yaml" {
 value = local.storageaccountlist
}
