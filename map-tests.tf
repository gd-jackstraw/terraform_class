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
}

locals {
simple_local_flattened_list = flatten(var.simple_nested_list)
}

output "simple_flattened_list_result" {
value = local.simple_local_flattened_list
}

output "simple_nested_list_result" {
value = var.simple_nested_list
}

locals {
  alphabets=["a","b","c","d","e"]
  numbers=[1,2,3,4,5]

  map_of_alpha-letter = {
  for index, letter in local.alphabets:letter => local.numbers[index]
  }
}
output "alpha-letter_readout" {
  value = local.map_of_alpha-letter
}



variable "nested_map" {
  type = map(map(string))
  default = {
    group1 = {"name" = "Alice", "age" = 36}
    group2 = {"name" = "Bob", "age" = 30}
  }
}

locals {
flattened_map = flatten([for k, v in var.nested_map : [for kk, vv in v : {group = k, key = kk, value = vv}]])
}

output "flattened_nested_map" {
  value = local.flattened_map 
}
