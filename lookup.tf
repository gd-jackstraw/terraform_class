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
