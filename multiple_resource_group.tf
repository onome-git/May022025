locals {
    multipleresource_groups = {
    rg-onome-eastus   = "eastus"
    rg-onome-westus   = "westus"
    rg-onome-central  = "centralus"
    rg-onome-canada   = "canadacentral"
    rg-onome-canadaeast  = "canadaeast"
  }
}

module "resource_groups2" {
  for_each = local.resource_group

  source   = "./modules/resource_group"
  name     = each.key
  location = each.value
  tags = {
    environment = "dev"
    team        = "infra"
  }
}
