resource "azurerm_resource_group" "mcitdevrm" {
  name     = "onomespmay022025"
  location = "canadacentral"
}

resource "azurerm_storage_account" "mcitdevrm" {
  for_each = local.full_service_names

  name                     = each.value
  resource_group_name      = azurerm_resource_group.mcitdevrm.name
  location                 = azurerm_resource_group.mcitdevrm.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

  tags = {
    environment = "dev"
  }






