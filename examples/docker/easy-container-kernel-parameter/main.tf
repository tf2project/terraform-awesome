# https://github.com/ssbostan/terraform-awesome

resource "docker_image" "nginx" {
  name = "nginx"
}

resource "docker_container" "container_002" {
  name    = "container_002"
  image   = docker_image.nginx.latest
  sysctls = tomap({ "net.ipv4.ip_forward" = 0, "net.ipv4.tcp_synack_retries" = 2, "net.ipv4.tcp_syncookies" = 0 })
}
