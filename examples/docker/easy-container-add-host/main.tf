# https://github.com/ssbostan/terraform-awesome

resource "docker_image" "nginx_image" {
  name = "nginx:latest"
}

resource "docker_container" "nginx_container" {
  name  = "nginx_container"
  image = docker_image.nginx_image.name
  host {
    host = "yourdomain.com"
    ip   = "127.0.0.1"
  }
  host {
    host = "cloudflare"
    ip   = "1.1.1.1"
  }
}
