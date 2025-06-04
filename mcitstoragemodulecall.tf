module "mymcitstorage" {
  source              = "./module/storage_account"  
  name                = "onomestorageaccount"
  resource_group_name = azurerm_resource_group.mcit420zz5um.name
  location            = azurerm_resource_group.mcit420zz5um.location
  account_tier        = "Standard"
  account_replication_type = "LRS"
  kind                = "StorageV2"
  access_tier         = "Hot"
  tags = {
    environment = "dev"
    team        = "infra"
  }
}

module "mymcitstorage_v4" {
  source = "./module/storage_account"

  for_each = var.storage_accounts  # Loops over the map to create 4 storage accounts

  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
  kind                     = each.value.kind
  access_tier              = each.value.access_tier
  tags                     = each.value.tags
}
