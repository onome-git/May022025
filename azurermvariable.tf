
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

