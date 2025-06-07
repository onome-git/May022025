
module "single_resource_group" {
  source   = ".modules/single_resource_group"
  name     = "rg-onome-eastus"
  location = "eastus"
  tags = {
    environment = "dev"
    team        = "infra"
  }
}
