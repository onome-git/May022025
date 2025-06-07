module "mymcitstorage_group1" {
  for_each = local.storage_accounts

  source              = "./module/storage_account" # this calls the module in main.tf👌
  name                = each.value.name
  resource_group_name = azurerm_resource_group.mcit420zz5um.name
  location            = azurerm_resource_group.mcit420zz5um.location
  account_tier        = each.value.account_tier
  account_replication_type = each.value.account_replication_type
  access_tier         = each.value.access_tier
  tags = {
    environment = "dev"
    team        = "infra"
  }
}

module "onomeforeachmcitstorage" {
  source              = "./module/storage_account"
  name                = "onomestorageacctstatic"
  resource_group_name = azurerm_resource_group.mcit420zz5um.name
  location            = azurerm_resource_group.mcit420zz5um.location
  account_tier        = "Standard"
  account_replication_type = "LRS"
  access_tier         = "Hot"
  tags = {
    environment = "dev"
    team        = "infra"
  }
}


