
locals {
  env_names = {
    dev     = "Development"
    staging = "Staging"
    prod    = "Production"
  }
}

locals {
  environment = lookup(local.env_names, terraform.workspace, "Unknown")
}
