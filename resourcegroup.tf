resource "azurerm_resource_group" "mcitdevrm" {
  name     = "onomespmay022025"
  location = "canadacentral"
}


resource "azurerm_storage_account" "mcitdevrm" {
  for_each = local.full_service_names

  name                      = each.value
  resource_group_name       = "onomeresources"  
  location                  = azurerm_resource_group.onomespmay022025.location
  account_tier              = "Standard"
  account_replication_type  = "LRS"
}
