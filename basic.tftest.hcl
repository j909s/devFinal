variables {
  repository_name = "MyRepo"
}

run "test_plan" {
  command = plan
}

run "test_apply" {
  command = apply
}

run "test_destroy" {
  command = destroy
}

assertions {
  assert "resource_group_name" {
    output = "resource_group_name"
    equals = "techielass"
  }

  assert "ddos_plan_name" {
    output = "ddos_plan_name"
    equals = "techielass"
  }

  assert "vnet_name" {
    output = "vnet_name"
    equals = "techielass"
  }

  assert "subnet_name" {
    output = "subnet_name"
    equals = "techielass"
  }

  assert "storage_name" {
    output = "storage_name"
    equals = "phpapp"
  }

  assert "container_name" {
    output = "container_name"
    equals = "appcontainer"
  }

  assert "repository_name" {
    output = "repository_name"
    equals = "MyRepo"
  }
}

