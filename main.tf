## 
# Local variables
##

locals {
  resource_group_name = "${var.naming_prefix}-${random_integer.name_suffix.result}"
  ddos_plan_name      = "${var.naming_prefix}-${random_integer.name_suffix.result}"
  vnet_name           = "${var.naming_prefix}-${random_integer.name_suffix.result}"
  subnet_name         = "${var.naming_prefix}-${random_integer.name_suffix.result}"
  storage_name        = "${var.naming_prefix}-${random_integer.name_suffix.result}"
}

resource "random_integer" "name_suffix" {
  min = 10000
  max = 99999
}




# Create Resource Group
resource "azurerm_resource_group" "techielassrg" {
  name     = local.resource_group_name
  location = var.location
  tags = {
    environment = var.tag_environment
    owner       = var.tag_owner
  }
}



# Create DDOS Protection Plan
resource "azurerm_network_ddos_protection_plan" "techielassddos" {
  name                = local.ddos_plan_name
  resource_group_name = azurerm_resource_group.techielassrg.name
  location            = azurerm_resource_group.techielassrg.location
  tags = {
    environment = var.tag_environment
    owner       = var.tag_owner
  }

}


# Create Virtual Network and enabled DDOS protection
resource "azurerm_virtual_network" "techielassvnet" {
  name                = local.vnet_name
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.techielassrg.location
  resource_group_name = azurerm_resource_group.techielassrg.name

  ddos_protection_plan {
    id     = azurerm_network_ddos_protection_plan.techielassddos.id
    enable = true
  }
  tags = {
    environment = var.tag_environment
    owner       = var.tag_owner
  }
}

# Create Subnet within virtual network
resource "azurerm_subnet" "techielasssubnet" {
  name                 = local.subnet_name
  resource_group_name  = azurerm_resource_group.techielassrg.name
  virtual_network_name = azurerm_virtual_network.techielassvnet.name
  address_prefixes     = ["10.0.0.0/24"]
}


resource "azurerm_storage_account" "techssa" {
  name                     = "phpapp"
  resource_group_name      = azurerm_resource_group.techielassrg.name
  location                 = azurerm_resource_group.techielassrg.location
  account_tier             ="standard"
  account_replication_type = "LRS"
  
  
}
 

resource "azurerm_storage_container" "techielasscontainer" {
  name                  = "appcontainer"
  storage_account_name  = azurerm_storage_account.techssa.name
  container_access_type = "private"
  
  
}


resource "azurerm_storage_blob" "techossblobs" {
  for_each = fileset(path.module, "phpApp/*")
  name                   = trim(each.key, "phpApp/")
  storage_account_name   = azurerm_storage_account.techssa.name
  storage_container_name = azurerm_storage_container.techielasscontainer.name
  type                   = "Block"
  source                 = each.key
  
}

# resource "azurerm_codecommit_repository" "test" {
#   repository_name = format("repo-%s", var.azurerm_resource_group)
#   description     = "Test repository."
# }