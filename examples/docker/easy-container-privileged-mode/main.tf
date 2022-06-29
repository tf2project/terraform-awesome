# https://github.com/ssbostan/terraform-awesome

resource "docker_container" "privileged_container" {
  name       = "privileged_container"
  image      = "alpine:latest"
  privileged = true
  command    = ["sleep", "1000"]
}
