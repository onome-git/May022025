locals {
  servicename           = "abracadabra"
  forum                 = "abracadabramcit"
  lengthsa              = length(local.servicename)
  winterlistOfSports    = ["icehockey", "snowboarding", "iceskating"]
  characters            = ["luke", "yoda", "darth"]
  enemies_destroyed     = [4252, 900, 20000056894]

  character_enemy_map = {
    for i, character in local.characters :
    character => local.enemies_destroyed[i]
  }

  top5_restaurants      = ["macdonald", "timhorton", "kingburger", "subway", "kfc"]
  top5_food             = ["fish", "fries", "tea", "salad", "pizza"]

  restaurants_food_map_zip = zipmap(local.top5_restaurants, local.top5_food)

  string_numbers        = ["42", "77", "13", "98", "3", "64", "55", "27", "89", "6"]

  number_sum = sum([
    for n in local.string_numbers : tonumber(n)])

  original_text = "I AM A STUDENT AT MCIT"
  lower_text    = lower(local.original_text)
}

  locals {
  quote           = "Montreal: Where potholes have their own zip code."
  upper_quote     = upper(local.quote)
  lower_quote     = lower(local.quote)
  short_quote     = substr(local.quote, 0, 10)
  reversed        = join("", reverse(split("", local.quote)))
  replaced        = replace(local.quote, "potholes", "craters")
  has_zip         = can(index(local.quote, "zip"))
  joined_quotes   = join(" | ", [local.quote, "Stay safe!"])
  words           = split(" ", local.quote)
  quote_length    = length(local.quote)
  branded_quote   = "${local.quote} - City of Surprises"
}

locals {
  sentence_1 = "Montreal bagels taste better at 3am."
  reversed_sentence = join(" ", reverse(split(" ", local.sentence_1)))
}

locals {
  cleaned_sentence = replace(var.sentence_2, ".", "")
  words_v2 = split(" ", local.cleaned_sentence)
  last_word_v2 = local.words_v2[length(local.words_v2) - 1]
}
locals {
  vowels = regexall("[aeiouAEIOU]", var.sentence)
  vowel_count = length(local.vowels)
}
locals {
  sentence_4          = "Why does St-Laurent never sleep?"
  modified_sentence_4 = replace(local.sentence_4, " ", "_")
}

locals {
  sentence_5           = "Bagels in Montreal are boiled, not baked."
  sentence5_words      = split(" ", local.sentence_5)
  third_word_sentence5 = local.sentence5_words[2]
}
locals {
  sentence_6              = "Is this the best food city in Canada?"
  sentence_6_no_punct     = replace(local.sentence_6, "?", "")
}

locals {
  sentence_7       = "Montreal's food scene is elite!"
  chars_list       = split("", local.sentence_7)
  even_chars       = [for i in range(length(local.chars_list)) : local.chars_list[i] if i % 2 == 0]
  even_positioned  = join("", local.even_chars)
}
locals {
  sentence_8            = "Late-night diners are a blessing."
  words_8               = split(" ", local.sentence_8)
  reversed_words_8      = reverse(local.words_8)
  sentence_8_reversed   = join(" ", local.reversed_words_8)
}

locals {
  sentence_9         = "every foodie should visit once."
  words_9            = split(" ", local.sentence_9)
  capitalized_words  = [
    for word in local.words_9 : format("%s%s", upper(substr(word, 0, 1)), substr(word, 1, length(word) - 1))
  ]
  sentence_9_capitalized = join(" ", local.capitalized_words)
}
locals {
  sentence_10 = "tastes of montreal at every corner"

  short_words = ["in", "of", "at"]

  words_10 = split(" ", local.sentence_10)

  capitalized_words_10 = [
    for i, word in local.words_10 : (
      i == 0 || !(contains(local.short_words, word)) ?
      format("%s%s", upper(substr(word, 0, 1)), substr(word, 1, length(word) - 1)) :
      word
    )
  ]

  sentence_10_title_case = join(" ", local.capitalized_words_10)
}
locals {
  sentence_input = "antione sean negar ovadia."
  sentence_words = split(" ", trim(local.sentence_input, "."))
  sentence_last_word = local.sentence_words[length(local.sentence_words) - 1]
}
locals {
  full_servicename = "${var.servicename}=${var.env}"
}
locals {
  full_service_names = {
    for env in var.environments :
    env => "${env}${var.service_name}"
  }
}
locals {
  nested_list = [
    ["apple", "banana"],
    ["orange", "grape"],
    ["kiwi"]
  ]

  flat_list = flatten([
    ["apple", "banana"],
    ["orange", "grape"],
    ["kiwi"]
  ])
}

locals {
  vms = ["vm1", "vm2", "vm3"]

  vms_map = {
    for idx, name in local.vms :
    "vm_${idx}" => name
  }
}

locals {
  apps = ["api", "frontend", "worker", "db"]
}
locals {
  rg_names = ["dev-rg", "test-rg", "prod-rg"]
}

resource "azurerm_resource_group" "rgs" {
  for_each = toset(local.rg_names)
  name     = each.value
  location = "East US"
}
locals {
  keys   = ["env", "team", "owner"]
  values = ["prod", "devops", "alice"]

  combined_map = zipmap(local.keys, local.values)
}


locals {
  regions      = ["eastus", "westeurope", "southindia", "centralus"]
  filtered_us  = [for r in local.regions : r if can(regex("us", r))]
}

locals {
  cidrs = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

provider "azurerm" {
  features {}
}

locals {
  vm_names = ["webvm-1", "webvm-2", "webvm-3"]
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_subnet" "example" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "example" {
  for_each = toset(local.vm_names)

  name                = "${each.key}-nic"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "example" {
  for_each = toset(local.vm_names)

  name                = each.key
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  
  network_interface_ids = [
    azurerm_network_interface.example[each.key].id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}
