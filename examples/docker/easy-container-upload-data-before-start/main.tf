# https://github.com/ssbostan/terraform-awesome

resource "docker_container" "nginx_container" {
  name  = "nginx_container"
  image = "nginx:latest"
  ports {
    internal = 80
    external = 80
  }
  upload {
    source = "index.html"
    file   = "/usr/share/nginx/html/index.html"
  }
}
