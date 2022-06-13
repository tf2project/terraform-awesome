# https://github.com/ssbostan/terraform-awesome

resource "docker_image" "nginx_image" {
  name = "nginx:latest"
}

resource "docker_container" "nginx_container" {
  name   = "nginx_container"
  image  = docker_image.nginx_image.name
  memory = 1024
  volumes {
    host_path      = abspath("nginx.conf")
    container_path = "/etc/nginx/nginx.conf"
  }
  ports {
    internal = "80"
    external = "80"
  }
}