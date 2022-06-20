# https://github.com/ssbostan/terraform-awesome

resource "docker_image" "nginx_image" {
  name = "nginx:latest"
}

resource "docker_container" "nginx_container" {
  name    = "nginx_container"
  image   = docker_image.nginx_image.name
  restart = "always"
  memory  = 1024
  volumes {
    host_path      = abspath("nginx.conf")
    container_path = "/etc/nginx/nginx.conf"
  }
  volumes {
    host_path      = abspath("tls.crt")
    container_path = "/etc/nginx/certs/tls.crt"
  }
  volumes {
    host_path      = abspath("tls.key")
    container_path = "/etc/nginx/certs/tls.key"
  }
  ports {
    internal = "80"
    external = "80"
  }
  ports {
    internal = "443"
    external = "443"
  }
  labels {
    label = "app.docker.io/name"
    value = "nginx"
  }
  labels {
    label = "app.docker.io/created-by"
    value = "terraform-awesome"
  }
  depends_on = [
    local_file.nginx_https_tls_key,
    local_file.nginx_https_tls_cert
  ]
}
