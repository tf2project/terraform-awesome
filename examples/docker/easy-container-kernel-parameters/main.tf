# https://github.com/ssbostan/terraform-awesome

resource "docker_container" "alpine_container" {
  name    = "alpine_container"
  image   = "alpine:latest"
  command = ["sleep", "1000"]
  sysctls = {
    "net.ipv4.ip_forward"         = "1"
    "net.ipv4.tcp_synack_retries" = "2"
    "net.ipv4.tcp_syncookies"     = "1"
  }
}
