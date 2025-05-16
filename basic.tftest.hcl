variables {
  naming_prefix = "techielass"
  location      = "easteurope"
}

run "test_plan" {
  command = plan

  check "resource_group_name" {
    output = "resource_group_name"
    contains = "techielass"
  }

  check "ddos_plan_name" {
    output = "ddos_plan_name"
    contains = "techielass"
  }

  check "vnet_name" {
    output = "vnet_name"
    contains = "techielass"
  }

  check "subnet_name" {
    output = "subnet_name"
    contains = "techielass"
  }

  check "storage_name" {
    output = "storage_name"
    contains = "phpapp"
  }

  check "container_name" {
    output = "container_name"
    contains = "appcontainer"
  }
}



