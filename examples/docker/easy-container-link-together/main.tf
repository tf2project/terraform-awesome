# https://github.com/ssbostan/terraform-awesome

resource "docker_image" "nginx_image" {
  name = "nginx:latest"
}

resource "docker_image" "alpine_image" {
  name = "alpine:latest"
}

resource "docker_container" "nginx_container" {
  image = docker_image.nginx_image.name
  name  = "nginx_container"
}

resource "docker_container" "alpine_container" {
  image   = docker_image.alpine_image.name
  name    = "alpine_container"
  links   = toset(["${docker_container.nginx_container.name}"])
  command = ["sleep", "1000"]
}
