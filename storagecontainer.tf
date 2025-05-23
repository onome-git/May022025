resource "azurerm_storage_container" "onomecontainer" {
  name                  = "onomecontainer"
  storage_account_id    = azurerm_storage_account.mcitstorage_v2.id
  container_access_type = "private"
}
