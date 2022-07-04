# https://github.com/ssbostan/terraform-awesome

resource "github_branch" "development" {
  repository = var.github_repository
  branch     = "development"
}
