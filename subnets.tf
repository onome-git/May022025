locals {
  region       = "eastus"
  is_primary   = local.region == "eastus" ? true : false
  environment1  = local.is_primary ? "production1" : "staging1"
}

output "region" {
  value = local.region
}

output "is_primary_region" {
  value = local.is_primary
}

output "environment2" {
  value = local.environment2
}

locals {
  subnets = {
    frontend = "10.0.1.0/24"
    backend  = "10.0.2.0/24"
    db       = "10.0.3.0/24"
  }
}
