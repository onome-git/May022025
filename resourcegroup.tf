resource "azurerm_resource_group" "mcitdevrm" {
  name     = "onomespmay022025"
  location = "canadacentral"
}

resource "azurerm_storage_account" "mcitdevrm" {
  for_each = local.full_service_names

  name                     = each.value
  resource_group_name      = azurerm_resource_group.mcitdevrm.name
  location                 = azurerm_resource_group.mcitdevrm.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "dev"
  }
}

resource "azurerm_virtual_network" "example" {
  name                = "example-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = "East US"
  resource_group_name = "example-rg"
}

resource "azurerm_subnet" "subnets" {
  for_each = { for idx, cidr in local.cidrs : idx => cidr }

  name                 = "subnet-${each.key}"
  resource_group_name  = azurerm_virtual_network.example.resource_group_name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = [each.value]
}
