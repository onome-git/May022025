output "print"{
    value = local.servicename
}
output "secondprint"{
    value = local.forum
}
 
output "lengthsa"{
    value=local.lengthsa
}

output "wintersportslist"{
    value=[for sport in local.winterlistOfSports:sport]
   
}

output "character_enemy_output" {
  value = local.character_enemy_map
}
output "top5restaurants_output" {
  value = local.character_food_map
}

output "uppercased_sentence" {
  value = upper([var.sentence: tonumber])
}
