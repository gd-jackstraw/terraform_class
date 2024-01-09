#locals {
 # characters = ["luke", "yoda", "darth"]
 # enemies_destroyed = [4252, 900, 29320984098]
#
#map = {
 # for index, character in toset(local.characters) :
# Convert chracter list to a set
  #  character => local.enemies_destroyed[index]
  #}
#}
#
#output "starwars_char_deaths"{
# value= [for index, character in toset(local.characters):character => local.enemies_destroyed[index]]
#}
