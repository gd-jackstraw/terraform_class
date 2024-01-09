locals {
  characters = ["luke", "yoda", "darth"]
  enemies_destroyed = [4252, 900, 29320984098]

map = {
  for index, character in toset(local.characters) :
# Convert chracter list to a set
    character => local.enemies_destroyed[number]
  }
}

output "character_kills"{
  value= local.map
}
