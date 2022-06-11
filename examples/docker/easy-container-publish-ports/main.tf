# https://github.com/ssbostan/terraform-awesome

resource "docker_image" "nginx_image" {
  name = "nginx:latest"
}

resource "docker_container" "nginx_container" {
  image = docker_image.nginx_image.name
  name  = "nginx_container"
  ports {
    internal = "80"
    external = "8080"
  }
}
