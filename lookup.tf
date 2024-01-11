variable "my_map" {
  type = map(string)
  default = {
    "key1" = "value1"
    "key2" = "value2"
  }
}

locals {
  my_value = lookup(var.my_map, "key1", "")
}

output "my_value_output" {
  value = local.my_value
}



variable "user_roles" {
  type = map(string)
  default = { 
    alice = "admin"
    bob = "editor"
    charlie = "viewer"
  }
}

variable "default_roles" {
  value = string
  default = "guest"
}

locals {
  user_role_lookup = {
    alice = lookup(var.user_roles, "alice", var.default_role)
    bob = lookup(var.user_roles, "alice", var.default_role)
    charlie  = lookup(var.user_roles, "alice", var.default_role)
    david = lookup(var.user_roles, "alice", var.default_role)
  }
}

output "user_roles_results" {
  value = local.user_role_lookup
}
