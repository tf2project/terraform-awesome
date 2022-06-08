# https://github.com/ssbostan/terraform-awesome

data "docker_registry_image" "alpine" {
  name = "alpine:latest"
}

resource "docker_image" "ubuntu" {
  name          = data.docker_registry_image.alpine.name
  pull_triggers = [data.docker_registry_image.alpine.sha256_digest]
}
