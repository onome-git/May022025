module "mymcitstorage" {
  for_each = local.storage_accounts

  source              = "./modules/storage_account"
  name                = each.value.name
  resource_group_name = azurerm_resource_group.mcit420zz5um.name
  location            = azurerm_resource_group.mcit420zz5um.location
  account_tier        = each.value.account_tier
  account_replication_type = each.value.account_replication_type
  kind                = each.value.kind
  access_tier         = each.value.access_tier
  tags = {
    environment = "dev"
    team        = "infra"
  }
}



module "onomeforeachmcitstorage" {
  source              = "./modules/storage_account"
  name                = "onomestorageacct"
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
