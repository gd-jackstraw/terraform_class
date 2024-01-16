locals {  
loadbalancer =[for f in fileset("${path.module}/configs/loadbalancer-config/", "[^_]*.yaml") : yamldecode(file("${path.module}/configs/loadbalancer-config/${f}"))]
  lb_list = flatten([
    for lb in local.loadbalancer : [
      for lb-config in try(lb.loadbalancer_config, []) :{
        name=lb-config.name
      }
    ]
  ])
}

resource "azurerm_resource_group" "lb-rg" {
  name     = "LoadBalancerRG"
  location = "West Europe"
}

resource "azurerm_public_ip" "public_lb_ip" {
  name                = "PublicIPForLB"
  location            = azurerm_resource_group.lb-rg.location
  resource_group_name = azurerm_resource_group.lb-rg.name
  allocation_method   = Static
}

resource "azurerm_lb" "loadbalancer_resrouce" {
   for_each            ={for sp in local.lb_list: "${sp.name}"=>sp }
  name                = each.value.name
  location            = azurerm_resource_group.lb-rg.location
  resource_group_name = azurerm_resource_group.lb-rg.name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.public_lb_ip.id
  }
}

output "list_of_loa_balancer_names" {
  value =  local.lb_list
}
