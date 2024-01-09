output "Team_Name"{
  value = local.service_name

}
output "Stadium"{
    value = local.owner

}
output "Number_of_characters_in_the_team_name"{
  value = local.lengthofservice_name

}
output "Number_of_characters_in_the_Stadium_name"{
  value = local.lengthofowner

}

output "Number_of_spare_gloves_at_the_field"{
  value = local.spare_gloves
}

output "pointless_output"{
  value = local.lengthofspare_gloves
}

output "some_number"{
  value = var.countNumber
}

output "pieces_list"{
  value = var.pieces
}

output "staging_environment"{
  value = var.environment
}

output "list_of_winter_sports"{
  value=[for sport in local.winter_sports_list:sport]
}

output "Best_meals_in_Canada"{
  value =[for meals in local.canadas_best_meals:meals]
}

output "numbers1-10"{
  value=[for numbers in local.listofnumbers:numbers]

}

output "sumofnumbers"{
  value=sum([for numbers in local.variousnumbers:numbers])
}

output "numberlist_2"{
  value=var.numberlist_var
}

output "sumofnumberlist_2"{
  value=sum([for numbers in var.numberlist_var:numbers])
}

output "map_of_object_ex" {
  value = var.example_map
}

output "map_of_force_users" {
  value = var.force_map
}

output "lightsaber_colors" {
  value = var.lightsaber_color_map
}


output "character_kills"{
  value=[for index in toset(local.characters):character => local.enemies_destroyed[index]]

}
