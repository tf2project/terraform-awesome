# https://github.com/ssbostan/terraform-awesome

resource "docker_image" "nginx_image" {
  name = "nginx:latest"
}

resource "docker_network" "private_network" {
  name   = "my_network"
  driver = "bridge"
  ipam_config {
    gateway = "172.20.0.1"
    subnet  = "172.20.0.0/16"
  }
}

resource "docker_container" "simple_container" {
  name  = "simple_container"
  image = docker_image.nginx_image.latest
  networks_advanced {
    name = "my_network"
  }
}
