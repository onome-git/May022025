
locals {
  linux_app = [
    for f in fileset("${path.module}/configs", "[^_]*.yaml") : yamldecode(file("${path.module}/configs/${f}"))
  ]

  linux_app_list = flatten([
    for app in local.linux_app : [
      for linuxapps in try(app.listoflinuxapp, []) : {
        name     = linuxapps.name
        os_type  = linuxapps.os_type
        sku_name = linuxapps.sku_name     
      }
    ]
  ])
}

resource "azurerm_service_plan" "onomespmay022025" {
  for_each = { for sp in local.linux_app_list : sp.name => sp }

  name                = each.value.name
  resource_group_name  = azurerm_resource_group.onomespmay022025.name
  location            = azurerm_resource_group.onomespmay022025.location
  os_type             = each.value.os_type
  sku_name            = each.value.sku_name
}

resource "azurerm_linux_web_app" "onomespmay022025webapp" {
  for_each = azurerm_service_plan.onomespmay022025

  name                = each.value.name
  resource_group_name  = azurerm_resource_group.onomespmay022025.name
  location            = azurerm_resource_group.onomespmay022025.location
  service_plan_id     = each.value.id

  site_config {}
}
Summary:
Declare the azurerm_resource_group resource before referencing it.

Give it a valid name and location.

Then your other resources can reference it safely.

If you want me to generate a full working example based on your YAML files and variables, I’m here to help!







You said:
kindly help fix


ChatGPT said:
Certainly! Here is your fixed and complete Terraform configuration with the missing azurerm_resource_group resource added and all previous fixes applied:

hcl
Copy
Edit
# Define the Azure Resource Group
resource "azurerm_resource_group" "onomespmay022025" {
  name     = "onomespmay022025-rg"  # Change this to your preferred resource group name
  location = "East US"               # Change this to your desired Azure region
}

# Define locals to read and parse your YAML config files
locals {
  linux_app = [
    for f in fileset("${path.module}/configs", "[^_]*.yaml") : yamldecode(file("${path.module}/configs/${f}"))
  ]

  linux_app_list = flatten([
    for app in local.linux_app : [
      for linuxapps in try(app.listoflinuxapp, []) : {
        name     = linuxapps.name
        os_type  = linuxapps.os_type
        sku_name = linuxapps.sku_name     
      }
    ]
  ])
}

# Create Azure App Service Plans based on linux_app_list
resource "azurerm_service_plan" "onomespmay022025" {
  for_each = { for sp in local.linux_app_list : sp.name => sp }

  name                = each.value.name
  resource_group_name  = azurerm_resource_group.onomespmay022025.name
  location            = azurerm_resource_group.onomespmay022025.location
  os_type             = each.value.os_type
  sku_name            = each.value.sku_name
}

# Create Linux Web Apps associated with each App Service Plan
resource "azurerm_linux_web_app" "onomespmay022025webapp" {
  for_each = azurerm_service_plan.onomespmay022025

  name                = each.value.name
  resource_group_name  = azurerm_resource_group.onomespmay022025.name
  location            = azurerm_resource_group.onomespmay022025.location
  service_plan_id     = each.value.id

  site_config {}
}
