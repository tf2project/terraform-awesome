# https://github.com/ssbostan/terraform-awesome

resource "github_repository_file" "simple_github_repository_file" {
  repository          = var.github_repository
  branch              = "main"
  file                = "simple_file"
  content             = "This file was created by Terraform."
  commit_message      = "Managed by Terraform"
  commit_author       = "Terraform User"
  commit_email        = "example@terraform.com"
  overwrite_on_create = true
}