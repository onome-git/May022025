
locals {
  storage_account_names = [
    "storageacconome1",
    "storageacconome2",
    "storageacconome3",
    "storageacconome4",
    "storageacconome5",
  ]
}

module "mymcitstorage_v3" {
  for_each                  = toset(local.storage_account_names)
  source                    = "./module/storage_account"
  name                      = each.key
  resource_group_name       = azurerm_resource_group.mcit420zz5um.name
  location                  = azurerm_resource_group.mcit420zz5um.location
  account_tier              = "Standard"
  account_replication_type  = "LRS"
  kind                      = "StorageV2"
  access_tier               = "Hot"

  tags = {
    environment = "dev"
    team        = "infra"
  }
}
