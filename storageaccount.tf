resource "azurerm_storage_account" "mcitstorage" {
  name                     = var "onomestoragemay"
  resource_group_name      = azurerm_resource_group.terraformmay022025 "onomestoragemay"
  location                 = azurerm_resource_group.terraformmay022025.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "dev"
  }
}
