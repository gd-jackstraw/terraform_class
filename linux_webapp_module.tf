module "linux_webapp_module_ex" {
  source="./module_linux_webapp/"
    linux_app_name="module_linux_app"
    os_type="Linux"
    sku_name="P1v2"

}

output "linux_module_name" {
  value=module.linux_webapp_module_ex.linux_app_name
}
