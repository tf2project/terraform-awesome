# https://github.com/ssbostan/terraform-awesome

resource "random_pet" "nginx_container_name" {
  separator = ""
  length    = 1
}

resource "random_pet" "alpine_container_name" {
  separator = ""
  length    = 1
}

resource "docker_image" "nginx_image" {
  name = "nginx:latest"
}

resource "docker_image" "alpine_image" {
  name = "alpine:latest"
}

resource "docker_container" "nginx_container" {
  image = docker_image.nginx_image.name
  name  = "nginx-${random_pet.nginx_container_name.id}"
}

resource "docker_container" "alpine_container" {
  image   = docker_image.alpine_image.name
  name    = "alpine-${random_pet.alpine_container_name.id}"
  links   = toset(["${docker_container.nginx_container.name}"])
  command = ["sleep", "1000"]
}
