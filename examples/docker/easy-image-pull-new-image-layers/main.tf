# https://github.com/ssbostan/terraform-awesome

data "docker_registry_image" "nginx_image" {
  name = "nginx:latest"
}

resource "docker_image" "nginx_image" {
  name = data.docker_registry_image.nginx_image.name
  pull_triggers = [
    data.docker_registry_image.nginx_image.sha256_digest
  ]
}
