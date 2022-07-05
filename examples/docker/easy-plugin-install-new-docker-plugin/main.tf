# https://github.com/ssbostan/terraform-awesome

resource "docker_plugin" "docker_sshfs_plugin" {
  name                  = "vieux/sshfs"
  alias                 = "sshfs"
  env                   = ["DEBUG=1"]
  enabled               = true
  grant_all_permissions = true
  force_destroy         = false
  force_disable         = false
}
