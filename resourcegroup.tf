resource "azurerm_resource_group" "onomemay022025"{
  name= "onome_resource_group"
  location="canadacentral"
}
resource "azurerm_storage_account" "onomestoremay2025" {
  for_each = local.full_service_names

  name                      = each.value
  resource_group_name       = "onomeresources"  
  location                  = "East US"
  account_tier              = "Standard"
  account_replication_type  = "LRS"
}
