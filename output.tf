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

output "uppercased_sentence"{
value= upper(var.sentence)
}
output "list_of_numbers" {
value = local.lower_text
}
output "lowercased_sentence" {
value = local.lower_text
}
output "extract_canada"{
value = substr(var.full_text, 26, 6)
}
