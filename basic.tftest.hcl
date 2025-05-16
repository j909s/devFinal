variables {
  naming_prefix = "techielass"
  location      = "eastus"
  tag_environment = "dev"
  tag_owner = "owner@example.com"
}

run "plan" {
  command = "plan"
  assertions {
    resource "azurerm_resource_group" "techielassrg" {
      exists = true
      attributes = {
        name = regex("^techielass-[0-9]{5}$")
        location = "eastus"
        tags.environment = "dev"
        tags.owner = "owner@example.com"
      }
    }
    resource "azurerm_network_ddos_protection_plan" "techielassddos" {
      exists = true
      attributes = {
        name = regex("^techielass-[0-9]{5}$")
      }
    }
    resource "azurerm_virtual_network" "techielassvnet" {
      exists = true
      attributes = {
        name = regex("^techielass-[0-9]{5}$")
        ddos_protection_plan.enable = true
      }
    }
    resource "azurerm_subnet" "techielasssubnet" {
      exists = true
      attributes = {
        name = regex("^techielass-[0-9]{5}$")
        address_prefixes = ["10.0.0.0/24"]
      }
    }
    resource "azurerm_storage_account" "techssa" {
      exists = true
      attributes = {
        name = "phpapp"
        account_tier = "Standard"
        account_replication_type = "LRS"
      }
    }
    resource "azurerm_storage_container" "techielasscontainer" {
      exists = true
      attributes = {
        name = "appcontainer"
        container_access_type = "private"
      }
    }
  }
}