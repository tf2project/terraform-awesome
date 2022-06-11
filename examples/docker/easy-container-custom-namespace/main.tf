# https://github.com/ssbostan/terraform-awesome

resource "docker_image" "nginx" {
  name = "nginx"
}

resource "docker_container" "container_003" {
  name         = "container_003"
  image        = docker_image.nginx.latest
  userns_mode  = "terraformawesome:165536:65536"
  pid_mode     = "host"
  ipc_mode     = "host"
  network_mode = "host"
}




