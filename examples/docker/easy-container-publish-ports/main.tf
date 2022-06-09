# https://github.com/ssbostan/terraform-awesome

resource "random_pet" "nginx_container_name" {
  separator = ""
  length    = 1
}

resource "docker_image" "nginx_image" {
  name = "nginx:latest"
}

resource "docker_container" "nginx_container" {
  image = docker_image.nginx_image.name
  name  = "nginx-${random_pet.nginx_container_name.id}"
  ports {
    internal = "80"
    external = "8080"
  }
}
