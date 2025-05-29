
data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "mlrg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_application_insights" "applicationinsight" {
  name                = var.application_insights_name
  location            = azurerm_resource_group.mlrg.location
  resource_group_name = azurerm_resource_group.mlrg.name
  application_type    = "web"
}

resource "azurerm_key_vault" "azurekeyvault" {
  name                = var.key_vault_name
  location            = azurerm_resource_group.mlrg.location
  resource_group_name = azurerm_resource_group.mlrg.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "premium"
}

resource "azurerm_storage_account" "azurestorageaccount" {
  name                     = var.storage_account_name
  location                 = azurerm_resource_group.mlrg.location
  resource_group_name      = azurerm_resource_group.mlrg.name
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_machine_learning_workspace" "azuremlworkspace" {
  name                    = var.ml_workspace_name
  location                = azurerm_resource_group.mlrg.location
  resource_group_name     = azurerm_resource_group.mlrg.name
  application_insights_id = azurerm_application_insights.applicationinsight.id
  key_vault_id            = azurerm_key_vault.azurekeyvault.id
  storage_account_id      = azurerm_storage_account.azurestorageaccount.id

  identity {
    type = "SystemAssigned"
  }
}
