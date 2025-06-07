
module "resource_group" {
  source   = "./modules/resource_group"
  name     = "rg-onome-eastus"
  location = "eastus"
  tags = {
    environment = "dev"
    team        = "infra"
  }
}
