
locals {
  resource_groups = {                       # multiple resource groups
    rg-onome-eastus     = "eastus"
    rg-onome-westus     = "westus"
    rg-onome-central    = "centralus"
    rg-onome-canada     = "canadacentral"
    rg-onome-canadaeast = "canadaeast"
  }
}


module "resource_groups" {
  for_each = local.resource_groups

  source   = "./module/resource_group"
  name     = each.key
  location = each.value

  tags = {
    environment = "dev"
    team        = "infra"
  }
}
