module "linux_vm_module" {
  source = "./module_linux_vm/"

    name= "module_linux_vm_1"    
    size= "Standard_F2"
    admin_username= "adminuser"
}
