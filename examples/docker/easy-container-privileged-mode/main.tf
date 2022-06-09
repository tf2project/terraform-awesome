# https://github.com/ssbostan/terraform-awesome

resource "docker_image" "nginx_image" {
  name = "nginx:latest"
}

resource "docker_container" "privileged_container" {
  name       = "privileged_container"
  image      = docker_image.nginx_image.name
  privileged = true
}
