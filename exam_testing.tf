variable "nested_list" {
  type    = list(list(string))
  default = [["a", "b"], ["c", "d"], ["e", "f"]]
}
locals{
flattened_list = flatten(var.nested_list)
}
output "flattened_list_result" {
  value = local.flattened_list
}

variable "nested_map" {
  type    = map(map(string))
  default = {
    group1 = {"name" = "Bob", "age" = "25"}
    group2 = {"name" = "Alice", "age" = "30"}
  }
}
locals{
 flattened_map  = flatten([for k, v in var.nested_map : [for kk, vv in v : { group = k, key = kk, value = vv }]])
   }
output "flattened_map_result" {
  value = local.flattened_map
}
The output should be the following:
[
  { group = "group1", key = "name", value = "Alice" },
  { group = "group1", key = "age", value = "25" },
  { group = "group2", key = "name", value = "Bob" },
  { group = "group2", key = "age", value = "30" }
]
