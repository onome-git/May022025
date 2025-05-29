
variable "location" {
  description = "The Azure region to deploy resources into"
  type        = string
  default     = "West Europe"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "ml_rg-resources"
}

variable "application_insights_name" {
  description = "Name of the Application Insights resource"
  type        = string
  default     = "workspace-mcit-ai"
}

variable "key_vault_name" {
  description = "Name of the Key Vault"
  type        = string
  default     = "workspaceexamplekeyvault"
}

variable "storage_account_name" {
  description = "Name of the Storage Account"
  type        = string
  default     = "workspacestorageaccount"
}

variable "ml_workspace_name" {
  description = "Name of the Machine Learning Workspace"
  type        = string
  default     = "mcit-workspace"
}
✅ main.tf
hcl
Copy
Edit
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









