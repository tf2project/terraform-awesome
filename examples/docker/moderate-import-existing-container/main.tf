# https://github.com/ssbostan/terraform-awesome

resource "docker_container" "nginx_container" {
  name  = "nginx_container"
  image = "nginx:latest"
}
