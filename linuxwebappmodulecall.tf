locals {
  linux_web_apps = {
    mytestlinux-web-app-1 = "onomewebapp_1"
    mytestlinux-web-app-2 = "onomewebapp_2"
    mytestlinux-web-app-3 = "onomewebapp_3"
    mytestlinux-web-app-4 = "onomehwebapp_4"
    mytestlinux-web-app-5 = "onomewebapp_5"
  }
}

module "linux_web_app" {
  for_each            = local.linux_web_apps
  source              = "./module/linux_web_app"

  name                = each.key
  location            = azurerm_resource_group.onometerraform.location
  resource_group_name = azurerm_resource_group.onometerraform.name

  service_plan_name     = "mcit-app-service-plan"
  service_plan_sku_name = "B1"  # Example values: B1, S1, P1v3, EP1, etc.

  site_config = {
    always_on     = true
    http2_enabled = true
  }

  app_settings = {
    "ENV" = "dev"
  }

  tags = {
    environment = "dev"
    team        = "infra"
  }
}
