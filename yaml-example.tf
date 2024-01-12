locals {
  linux_app = [for f in fileset("${path.module}/configs", "[^_]*.yaml") : yamldecode(file("${path.module}/configs/${f}"))]
  linux_app_list = flatten([
      for app in local.linux_app : [  
        for linuxapps in try(app.listoflinuxapp, {}) : {
          name=linuxapps.name
          ostype=linuxapps.os_type
          sku_name=linuxapps.skuname
          }
        ]
      ])
    }

output "list_of_linux_app" {
value = local.linux_app
}
