# https://github.com/ssbostan/terraform-awesome

resource "docker_container" "alpine_container" {
  name    = "alpine_container"
  image   = "alpine:latest"
  command = ["ping", "google.com"]
  capabilities {
    add  = ["CAP_NET_RAW"]
    drop = ["ALL"]
  }
}
