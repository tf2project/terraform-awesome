# https://github.com/ssbostan/terraform-awesome

resource "docker_container" "nginx_container" {
  name  = "nginx_container"
  image = "nginx:latest"
}

resource "docker_container" "alpine_container" {
  name    = "alpine_container"
  image   = "alpine:latest"
  links   = ["${docker_container.nginx_container.id}"]
  command = ["ping", "nginx_container"]
}
