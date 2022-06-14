resource "docker_plugin" "sample-volume-plugin" {
  name                  = "tiborvass/sample-volume-plugin"
  alias                 = "sample-volume-plugin"
  enabled               = false
  grant_all_permissions = true
  force_destroy         = true
}