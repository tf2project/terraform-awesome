# https://github.com/ssbostan/terraform-awesome

resource "docker_network" "bridge_network" {
  name            = "bridge_network"
  driver          = "bridge"
  attachable      = true
  check_duplicate = true
  internal        = false
  options = {
    "com.docker.network.bridge.enable_icc" = "true"
  }
  ipam_config {
    aux_address = {
      "myrouter" = "192.168.10.1"
    }
    subnet   = "192.168.10.0/24"
    gateway  = "192.168.10.2"
    ip_range = "192.168.10.0/24"
  }
}

resource "docker_container" "alpine_container" {
  name    = "alpine_container"
  image   = "alpine:latest"
  command = ["sleep", "1000"]
  networks_advanced {
    name         = docker_network.bridge_network.name
    ipv4_address = "192.168.10.100"
    aliases = [
      "alpine",
      "alpine_container"
    ]
  }
}
