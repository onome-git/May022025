module "mymcitstorage_v4" {
  source                    = "./modules/storage_account"
  name                      = "onomestorageacct4"
  resource_group_name       = azurerm_resource_group.mcit420zz5um.name
  location                  = azurerm_resource_group.mcit420zz5um.location
  account_tier              = "Standard"
  account_replication_type  = "LRS"
  kind                      = "StorageV2"
  access_tier               = "Cool"

  tags = {
    environment = "dev"
    team        = "infra"
  }
}


