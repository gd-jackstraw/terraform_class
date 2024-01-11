locals {
  characters = ["luke", "yoda", "darth"]
  enemies_destroyed = [4252, 900, 29320984098]

map = {
 for index, character in (local.characters) :
  #Convert chracter list to a set
  character => local.enemies_destroyed[index]
 }
}
locals {
  alphabets=["a","b","c","d","e"]
  numbers=[1,2,3,4,5]

map_of_alpha-letter = {
for index, letter in local.alphabets:letter => local.numbers[index]
}

output "alpha-letter_readout" {
  vaue = local.map_of_alpha-letter
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
