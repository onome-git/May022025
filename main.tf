locals {
  region       = "eastus"
  is_primary   = local.region == "eastus" ? true : false
  environment  = local.is_primary ? "production" : "staging"
}

output "region" {
  value = local.region
}

output "is_primary_region" {
  value = local.is_primary
}

output "environment" {
  value = local.environment
}
