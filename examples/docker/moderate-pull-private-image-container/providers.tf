# https://github.com/ssbostan/terraform-awesome

provider "docker" {
  host = "unix:///var/run/docker.sock"
  registry_auth {
    address  = "registry-1.docker.io"
    username = "terraformawesome"
    password = "93b940bd-ac65-4e5e-aff9-274f3098f209"
  }
}
