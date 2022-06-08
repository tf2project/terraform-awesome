# https://github.com/ssbostan/terraform-awesome

resource "docker_container" "simple_container" {
  name     = "simple_container"
  image    = "hello-world:latest"
  must_run = false
}
