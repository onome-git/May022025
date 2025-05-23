resource "azurerm_service_plan" "batcha06sp" {
  for_each            = { for sp in local.linux_app_list : sp.name => sp }
  name                = "onomelinuxwebapp-${each.value.name}"
  resource_group_name = azurerm_resource_group.onomespmay022025v2.name
  location            = azurerm_resource_group.onomespmay022025v2.location
  os_type             = each.value.os_type
  sku_name            = each.value.sku_name
}

resource "azurerm_linux_web_app" "batcha06webapp" {
  for_each            = azurerm_service_plan.batcha06sp

  name                = "onomelinuxwebapp-${each.value.name}"
  resource_group_name = azurerm_resource_group.onomespmay022025v2.name
  location            = azurerm_resource_group.onomespmay022025v2.location
  service_plan_id     = each.value.id

  site_config {
    always_on = true
  }
}
