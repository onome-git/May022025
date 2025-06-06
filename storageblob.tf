resource "azurerm_storage_blob" "onomecontainer" {
  name                   = "my-awesome-content.zip"
  
  storage_account_name = azurerm_storage_account.mcitstorage_v2.name
  storage_container_name = azurerm_storage_container.onomecontainer.name
  type                   = "Block"
  source                 = "some-local-file.zip"
}
