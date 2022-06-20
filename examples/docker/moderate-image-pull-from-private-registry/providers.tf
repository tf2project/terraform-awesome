# https://github.com/ssbostan/terraform-awesome

provider "docker" {
  host = "unix:///var/run/docker.sock"
  registry_auth {
    address  = "localhost:5000"
    username = "test"
    password = "test"
  }
}
