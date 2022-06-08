# https://github.com/ssbostan/terraform-awesome


resource "docker_image" "nginx_image" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx_container" {
  name  = "nginx"
  image = docker_image.nginx_image.name
  ports {
    internal = 80
    external = 8080
  }

  volumes {
    container_path = "/usr/share/nginx/html"
    host_path      = "/data"
    read_only      = true
  }
}
