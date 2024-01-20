/* resource "azurerm_resource_group" "exam_example" {
  name     = "exam_example-rg"
  location = "West Europe"
}

locals{
  windows_function_app=[for f in fileset("${path.module}/configs", "[^_]*.yaml") : yamldecode(file("${path.module}/configs/${f}"))]
  windows_fa_list = flatten([
    for app in local.windows_function_app : [
      for windows_app in try(app.windowsfunctionapp, []) :{
        name=windows_app.name
        account_tier=windows_app.account_tier
        account_replication_type=windows_app.account_replication_type
        os_type=windows_app.os_type
        sku_name=windows_app.sku_name     
      }
    ]
])
}

resource "azurerm_storage_account" "sa_exam_example" {
  for_each                  ={for fa in local.windows_fa_list: "${fa.name}"=>fa }
  name                     = each.value.name
  resource_group_name      = azurerm_resource_group.exam_example.name
  location                 = azurerm_resource_group.exam_example.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
}

resource "azurerm_service_plan" "sp_exam_example" {
  for_each = azurerm_storage_account.sa_exam_example
  name                = each.value.name
  resource_group_name = azurerm_resource_group.exam_example.name
  location            = azurerm_resource_group.exam_example.location
  os_type             = each.value.os_type
  sku_name            = each.value.sku_name
}

resource "azurerm_windows_function_app" "windows_function_app_exam" {
  for_each = azurerm_storage_account.sa_exam_example
  name                = each.value.name
  resource_group_name = azurerm_resource_group.exam_example.name
  location            = azurerm_resource_group.exam_example.location

  storage_account_name       = azurerm_storage_account.sa_exam_example.name
  storage_account_access_key = azurerm_storage_account.sa_exam_example.primary_access_key
  service_plan_id            = each.value.id

  site_config {}
}
*/
