# https://github.com/ssbostan/terraform-awesome

resource "docker_image" "alpine_image" {
  name = "alpine:latest"
}

resource "docker_container" "alpine_container" {
  name         = "alpine_container"
  image        = docker_image.alpine_image.name
  must_run     = false
  command      = ["sh", "-c", "ps; ip a"]
  pid_mode     = "host"
  ipc_mode     = "host"
  userns_mode  = "host"
  network_mode = "host"
}
