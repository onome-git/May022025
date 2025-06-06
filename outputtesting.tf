
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

output "subnet_ids" {
  value = [for subnet in azurerm_subnet.subnets : subnet.id]
}

output "vm_ids" {
  value = { for vm_name, vm in azurerm_windows_virtual_machine.example : vm_name => vm.id }
  description = "Map of VM names to their resource IDs"
}

output "vm_private_ips" {
  value = { for vm_name, nic in azurerm_network_interface.example : vm_name => nic.ip_configuration[0].private_ip_address }
  description = "Map of VM names to their private IP addresses"
}

output "selected_environment_name" {
  value       = local.environment
  description = "The friendly name of the current environment based on workspace."
}
