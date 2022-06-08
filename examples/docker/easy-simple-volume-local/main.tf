# https://github.com/ssbostan/terraform-awesome

resource "docker_volume" "simple_volume" {
  name   = "simple_volume"
  driver = "local"
  labels {
    label = "volume.docker.com/created-by"
    value = "Terraform Awesome"
  }
}
