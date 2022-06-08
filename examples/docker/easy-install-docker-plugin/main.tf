# https://github.com/ssbostan/terraform-awesome

resource "docker_plugin" "nfs-volume-plugin" {
  name                  = "trajano/nfs-volume-plugin"
  alias                 = "nfs"
  enabled               = true
  grant_all_permissions = true
  force_destroy         = true
  enable_timeout        = 60
  force_disable         = true
  env = [
    "DEBUG=1"
  ]
}