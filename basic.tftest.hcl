variables {
  naming_prefix = "techielass"
  location      = "eastus"
}

run "test_plan" {
  command = plan
}

run "test_apply" {
  command = apply

  assertion "resource_group_name" {
    output = "resource_group_name"
    equals = "techielass"
  }

  assertion "ddos_plan_name" {
    output = "ddos_plan_name"
    equals = "techielass"
  }

  assertion "vnet_name" {
    output = "vnet_name"
    equals = "techielass"
  }

  assertion "subnet_name" {
    output = "subnet_name"
    equals = "techielass"
  }

  assertion "storage_name" {
    output = "storage_name"
    equals = "phpapp"
  }

  assertion "container_name" {
    output = "container_name"
    equals = "appcontainer"
  }
}



