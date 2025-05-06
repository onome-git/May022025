resource "azurerm_storage_account" "mcitstorage" {
  name                     = var.onomestoragemay
  resource_group_name      = azurerm_resource_group.onomestoragemay
  location                 = azurerm_resource_group.group.onomestoragemay.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "dev"
  }
}
