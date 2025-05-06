resource "azurerm_storage_blob" "example" {
  name                   = "my-awesome-content.zip"
  storage_account_name   = azurerm_storage_account.mcitstorage.name
  storage_container_name = azurerm_storage_container.mcitstoragecontainer.name
  type                   = "Block"
  source                 = "some-local-file.zip"
}
