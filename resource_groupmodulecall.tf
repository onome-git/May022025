
module "single_resource_group" {
  source   = "./modules/resource_group"
  name     = "onome-rg"
  location = "eastus"
  tags = {
    environment = "dev"
    team        = "infra"
  }
}
