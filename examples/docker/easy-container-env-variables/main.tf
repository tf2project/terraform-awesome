# https://github.com/ssbostan/terraform-awesome

resource "docker_image" "nginx" {
  name = "nginx:latest"
}

resource "docker_container" "nginx_container" {
  name = var.container_name
  hostname = var.hostname
  image = docker_image.nginx.name
}
