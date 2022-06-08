# https://github.com/ssbostan/terraform-awesome

resource "docker_plugin" "docker_nfs_plugin" {
  name                  = "trajano/nfs-volume-plugin"
  alias                 = "nfs"
  enabled               = true
  grant_all_permissions = true
  force_destroy         = true
}
