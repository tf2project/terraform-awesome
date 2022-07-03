# https://github.com/ssbostan/terraform-awesome

resource "github_repository" "public" {
  name        = "public-awesome"
  description = "A public-visible repository created by Terraform awesome"
  visibility  = "public"
}

resource "github_repository" "private" {
  name        = "private-vawesome"
  description = "A private-visible repository created by Terraform awesome"
  visibility  = "private"
}