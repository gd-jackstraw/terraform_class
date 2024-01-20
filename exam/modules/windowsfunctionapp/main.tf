resource "azurerm_resource_group" "exam_example" {
  name     = "exam_example-rg"
  location = "West Europe"
}


resource "azurerm_storage_account" "sa_exam_example" {
  name                     = "windowsfunctionappsa"
  resource_group_name      = azurerm_resource_group.exam_example.name
  location                 = azurerm_resource_group.exam_example.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}

resource "azurerm_service_plan" "sp_exam_example" {
  name                = "example-app-service-plan"
  resource_group_name = azurerm_resource_group.exam_example.name
  location            = azurerm_resource_group.exam_example.location
  os_type             = var.os_type
  sku_name            = var.sku_name
}

resource "azurerm_windows_function_app" "windows_function_app_exam" {
  name                = var.wfaname
  resource_group_name = azurerm_resource_group.exam_example.name
  location            = azurerm_resource_group.exam_example.location

  storage_account_name       = azurerm_storage_account.sa_exam_example.name
  storage_account_access_key = azurerm_storage_account.sa_exam_example.primary_access_key
  service_plan_id            = azurerm_service_plan.sp_exam_example.id

  site_config {}
}
