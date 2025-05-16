variables {
  location      = "eastus"
  tag_environment = "dev"
  tag_owner = "owner@example.com"
}



  run "test_resource_creation"{
    resource "azurerm_storage_account" "techssa" {
      exists = true
      attributes = {
        name                     = "phpapp"
        account_tier             = "Standard"
        account_replication_type = "LRS"
        location                 = "eastus"
      }
    }
    command = plan
  }
}