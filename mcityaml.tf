locals {
  windows_app = [
    for f in fileset("${path.module}/${var.folderlocation}", "[^_]*.yaml") : yamldecode(file("${path.module}/${var.folderlocation}/${f}"))
  ]

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
  name     = "onomespmay022025v2"
  location = "canadacentral"
}

resource "azurerm_service_plan" "onomespmay022025v2" {
  for_each            = { for sp in local.windows_app_list : sp.name => sp }

  name                = each.value.name
  resource_group_name = azurerm_resource_group.onomespmay022025v2.name
  location            = azurerm_resource_group.onomespmay022025v2.location
  os_type             = each.value.os_type
  sku_name            = each.value.sku_name
}

resource "azurerm_windows_web_app" "onomespmay022025v2webapp" {
  for_each            = azurerm_service_plan.onomespmay022025v2

  name                = each.value.name
  resource_group_name = azurerm_resource_group.onomespmay022025v2.name
  location            = azurerm_resource_group.onomespmay022025v2.location
  service_plan_id     = each.value.id

  site_config {}
}
