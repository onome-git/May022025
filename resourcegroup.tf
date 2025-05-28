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

resource "azurerm_virtual_network" "example2" {
  name                = "example2-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = "East US"
  resource_group_name = "example2-rg"
}

resource "azurerm_subnet" "subnets" {
  for_each = { for idx, cidr in local.cidrs : idx => cidr }

  name                 = "subnet-${each.key}"
  resource_group_name  = azurerm_virtual_network.example.resource_group_name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = [each.value]
}

resource "azurerm_resource_group" "rg" {
  name     = "example-resources"
  location = "eastus"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "example-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet" {
  for_each             = local.subnets
  name                 = each.key
  address_prefixes     = [each.value]
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = azurerm_resource_group.rg.name
}


