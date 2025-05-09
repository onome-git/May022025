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

output "sum_number" {
  value = sum[for sum in local.sum_numbere: tonumber]
}
