resource "azurerm_storage_container" "onomecontainer" {
  name                  = "content"
  storage_account_id    = azurerm_storage_account.mcitstorage.id
  container_access_type = "private"
}
