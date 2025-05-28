output "subnet_names" {
  value = [for k in keys(local.subnets) : k]
}

output "subnet_cidrs" {
  value = [for v in values(local.subnets) : v]
}

output "subnet_map" {
  value = local.subnets
}
