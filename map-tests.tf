locals {
  characters = ["luke", "yoda", "darth"]
  enemies_destroyed = [4252, 900, 29320984098]

map = {
  for index, character in toset(local.characters) :
# Convert character list to a set
    character => local.enemies_destroyed[index]
  }
}

output "starwars_char_deaths"{
  value= [for index in local.characters :character => local.enemies_destroyed[index]]
}
