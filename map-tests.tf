locals {
  characters = ["luke", "yoda", "darth"]
  enemies_destroyed = [4252, 900, 29320984098]

map = {
 for index, character in (local.characters) :
  #Convert chracter list to a set
  character => local.enemies_destroyed[index]
 }
}

output "starwars_char_deaths"{
 value= local.map
}


variable "simple_nested_list" {
  type = list(list(string))
  default = [["a","b"], ["c","d"], ["e","f"]]

locals {
simple_local_flattened_list = flatten(var.simple_nested_list)
}

output "simple_flattened_list_result" {
value = local.simple_local_flattened_list
}

output "simple_nested_list_result" {
value = var.simple_nested_list
}
