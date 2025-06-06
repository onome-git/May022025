
locals {
  storage_accounts = {
    sa1 = {
      name                     = "onomestorageacct1"
      account_tier             = "Standard"
      account_replication_type = "LRS"
      kind                     = "StorageV2"
      access_tier              = "Hot"
    }
    sa2 = {
      name                     = "onomestorageacct2"
      account_tier             = "Standard"
      account_replication_type = "GRS"
      kind                     = "StorageV2"
      access_tier              = "Cool"
    }
    sa3 = {
      name                     = "onomestorageacct3"
      account_tier             = "Standard"
      account_replication_type = "ZRS"
      kind                     = "StorageV2"
      access_tier              = "Hot"
    }
    sa4 = {
      name                     = "onomestorageacct4"
      account_tier             = "Standard"
      account_replication_type = "LRS"
      kind                     = "StorageV2"
      access_tier              = "Cool"
    }
    sa5 = {
      name                     = "onomestorageacct5"
      account_tier             = "Standard"
      account_replication_type = "GRS"
      kind                     = "StorageV2"
      access_tier              = "Hot"
    }
  }
}


module "mymcitstorage_group2" {
  for_each = local.storage_accounts
  source   = "./module/storage_account"

  name                     = each.value.name
  resource_group_name      = azurerm_resource_group.mcit420zz5um.name
  location                 = azurerm_resource_group.mcit420zz5um.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
  access_tier              = each.value.access_tier

  tags = {
    environment = "dev"
    team        = "infra"
  }
}
