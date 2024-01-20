module "windowsfuction_app" {
  source   = "./modules/windowsfunctionapp"
  name= var.wfaname
  account_tier= var.account_tier
  account_replication_type= var.account_replication_type
  os_type= var.os_type
  sku_name= var.os_type
