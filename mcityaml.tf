locals {

  windows_app = [for f in fileset("${path.module}/var.configs_folder", "[^_]*.yaml") : yamldecode(file("${path.module}/configs/${f}"))]

  windows_app_list = flatten([
    for app in local.windows_app : [
      for windowsapps in try(app.listofwindowsapp, []) : {
        name     = windowsapps.name
        os_type  = windowsapps.os_type
        sku_name = windowsapps.sku_name     
      }
    ]
  ])
}

resource "azurerm_resource_group" "onomespmay022025v2" {
  name     = windowsapps.name
  location =  azurerm_resource_group.onomespmay022025v2.location
}


resource "azurerm_service_plan" "onomespmay022025v2" {
  for_each            = { for sp in local.windows_app_list : sp.name => sp }

  name                = windowsapps.name
  resource_group_name = azurerm_resource_group.onomespmay022025v2.name
  location            = azurerm_resource_group.onomespmay022025v2.location
  os_type             = each.value.os_type
  sku_name            = each.value.sku_name
}


resource "azurerm_windows_web_app" "onomespmay022025v2webapp" {
  for_each            = azurerm_service_plan.onomemay022025v2

  name                = windowsapps.name
  resource_group_name = azurerm_resource_group.onomespmay022025v2.name
  location            = azurerm_resource_group.onomemay022025v2.location
  service_plan_id     = each.value.id

  site_config {}
}
