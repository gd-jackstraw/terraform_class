locals{
 waf-vm_0 =[for f in fileset("${path.module}/configs/waf-config", "[^_]*.yaml") : yamldecode(file("${path.module}/configs/waf-config/${f}"))]
 waf-list = flatten([
    for info in local.waf-vm_0 : [
      for waf-1 in try(info.wafpolicy, []) :{
        name=waf-vm_0.name
        resource_group_name=waf-vm0_.resource_group_name
        location=waf-vm_0.location
      }
    ]
  ])
}


resource "azurerm_web_application_firewall_policy" "waf-windowsvm" {

  for_each            ={for waf in local.waf-vm_0: "${waf.name}"=>waf }
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
}

