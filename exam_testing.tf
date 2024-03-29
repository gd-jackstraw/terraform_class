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

variable "nested_map_exam" {
  type    = map(map(string))
  default = {
    group1 = {"name" = "Bob", "age" = "25"}
    group2 = {"name" = "Alice", "age" = "30"}
  }
}
locals{
 flattened_map_exam  = flatten([for k, v in var.nested_map_exam : [for kk, vv in v : { group = k, key = kk, value = vv }]])
   }
output "flattened_map_result" {
  value = local.flattened_map_exam
}

output "character_mapping"{
value={for index,character in local.characters:
      character => local.enemies_destroyed[index]}
}

locals{
  total_output = ["150", "150", "150"]
}
output "sumofthreenumbers"{
    value=sum([for numberoutput in local.total_output: tonumber(numberoutput)])
}
