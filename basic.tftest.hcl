variables {
  repository_name = "MyRepo"
}

run "test_resource_creation" {
  command = plan
}

run "test_apply" {
  command = apply
}

run "test_destroy" {
  command = destroy
}

check "resource_group" {
  output = "resource_group_name"
  value  = "techielass"
}

check "ddos_protection_plan" {
  output = "ddos_plan_name"
  value  = "techielass"
}

check "virtual_network" {
  output = "vnet_name"
  value  = "techielass"
}

check "subnet" {
  output = "subnet_name"
  value  = "techielass"
}

check "storage_account" {
  output = "storage_name"
  value  = "phpapp"
}

check "storage_container" {
  output = "container_name"
  value  = "appcontainer"
}

check "repository_name" {
  output = "repository_name"
  value  = "MyRepo"
}
