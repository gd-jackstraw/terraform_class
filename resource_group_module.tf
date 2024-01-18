module "resource_group" {
    source = "./module_resource_group/"

      resource_group_name     = "module_RG"
      location = "eastus"

  }

output "rg-module-name" {
    value=module.resource_group.resource_group_name 
}
