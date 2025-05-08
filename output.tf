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
    value=[for sport in local.winterlistOfSports:hockey,basketball,soccer,volleyball,skating]
}

output "character_enemy_output" {
  value = local.character_enemy_map
}
output "top5restaurants_output" {
  value = local.character_food_map
}
