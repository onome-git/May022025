
module "mymcitstorage_v3" {
  source                    = "./modules/storage_account"
  name                      = "onomestorageacct3"
  resource_group_name       = azurerm_resource_group.mcit420zz5um.name
  location                  = azurerm_resource_group.mcit420zz5um.location
  account_tier              = "Standard"
  account_replication_type  = "ZRS"
  kind                      = "StorageV2"
  access_tier               = "Hot"

  tags = {
    environment = "dev"
    team        = "infra"
  }
}
