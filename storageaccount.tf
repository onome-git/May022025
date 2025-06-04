resource "azurerm_storage_account" "mcitstorage_v2" {
  name                     = "mcitstoragev2"
  resource_group_name      = azurerm_resource_group.onomespmay022025v2.name
  location                 = azurerm_resource_group.onomespmay022025v2.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_account" "mcitdevrm-v2" {
  for_each = local.full_service_names

  name                     = each.value
  resource_group_name      = azurerm_resource_group.mcitdevrm.name
  location                 = azurerm_resource_group.mcitdevrm.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
 

