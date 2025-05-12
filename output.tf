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
output "top5_restaurants_output" {
  value = local.top5_restaurants

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
output "extract_onome"{
value = substr(var.my_text, 11, 5)
}

output "trimmed_word" {
  value = trim(var.trimmed_word, " ")
}
 output "string_manipulations" {
  value = 
    upper          = local.upper_quote
    lower          = local.lower_quote
    first_10_chars = local.short_quote
    reversed       = local.reversed
    replaced       = local.replaced
    contains_zip   = local.has_zip
    joined         = local.joined_quotes
    split_words    = local.words
    length         = local.quote_length
    with_suffix    = local.branded_quote
  }
}
