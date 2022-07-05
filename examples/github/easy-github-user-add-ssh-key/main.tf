# https://github.com/ssbostan/terraform-awesome

resource "github_user_ssh_key" "simple_user_ssh_key" {
  title = "simple user ssh key"
  key   = file("~/.ssh/id_rsa.pub")
}