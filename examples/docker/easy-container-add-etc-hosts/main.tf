# https://github.com/ssbostan/terraform-awesome

resource "docker_container" "alpine_container" {
  name    = "alpine_container"
  image   = "alpine:latest"
  command = ["sleep", "1000"]
  host {
    host = "mysite.com"
    ip   = "192.168.10.100"
  }
  host {
    host = "cloudflare"
    ip   = "1.1.1.1"
  }
}
