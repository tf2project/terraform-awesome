# https://github.com/ssbostan/terraform-awesome

resource "docker_network" "simple_network" {
  name = "simple_network"
}

resource "docker_container" "simple_container" {
  name  = "simple_container"
  image = "nginx:latest"
  networks_advanced {
    name    = "simple_network"
    aliases = ["simple", "alpine"]
  }
}
