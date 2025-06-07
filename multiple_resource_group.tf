
locals {
  multipleresource_groups = {
    rg-onome-eastus     = "eastus"
    rg-onome-westus     = "westus"
    rg-onome-central    = "centralus"
    rg-onome-canada     = "canadacentral"
    rg-onome-canadaeast = "canadaeast"
  }
}

module "multiple_resource_groups" {
  for_each = local.multipleresource_groups

  source   = "./modules/resource_group"
  name     = each.key
  location = each.value
  tags = {
    environment = "dev"
    team        = "infra"
  }
}
