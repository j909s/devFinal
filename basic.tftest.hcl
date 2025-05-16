variables {
  repository_name = "MyRepo"
}

run "test_resource_creation" {
  command = plan

  assert {
    condition = startswith(azurerm_codecommit_repository.test.repository_name, "repo-")
    error_message = "CodeCommit repository name ${var.repository_name} did not start with the expected value of ‘repo-****’."
  }

}