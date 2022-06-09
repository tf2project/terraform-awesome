# https://github.com/ssbostan/terraform-awesome

resource "docker_image" "privileged_nginx" {
  #  name = "ubuntu:precise"
  name = "nginx:latest"
}
resource "docker_container" "privileged_container" {
  name       = "privileged_container"
  image      = docker_image.privileged_nginx.name
  privileged = true
}
