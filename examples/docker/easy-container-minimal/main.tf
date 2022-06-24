# https://github.com/ssbostan/terraform-awesome

resource "docker_container" "simple_container" {
  name  = "simple_container"
  image = "nginx:latest"
}
