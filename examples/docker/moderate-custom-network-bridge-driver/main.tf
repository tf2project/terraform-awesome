# https://github.com/ssbostan/terraform-awesome

resource "docker_network" "custom_network" {
  name   = "custom_network"
  driver = "bridge"
  ipam_config {
    ip_range = "172.28.5.0/24"
    subnet   = "172.28.0.0/16"
    gateway  = "172.28.5.254"
  }
}

resource "docker_container" "alpine_container" {
  name  = "alpine_container"
  image = "alpine:latest"
  command = [
    "tail",
    "-f",
    "/dev/null"
  ]
  networks_advanced {
    name = docker_network.custom_network.name
  }
}
