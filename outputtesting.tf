
output "last_wordv2" {
  value = local.sentence_last_word
}

output "full_servicename" {
  value = local.full_servicename
}

output "onome16may2025" {
  value = local.full_service_names
}

output "last_word_in_sentence" {
  value = local.sentence_last_wordv3
}
output "uppercase_names" {
  value = local.upper_names
}


output "vms_map" {
  value = local.vms_map
}
output "resource_group_names" {
  value = [for rg in azurerm_resource_group.rgs : rg.name]
}

output "combined_map" {
  value = local.combined_map
}

output "regions_with_us" {
  value = local.filtered_us
}

output "apps_count" {
  value = length(local.apps)
}
