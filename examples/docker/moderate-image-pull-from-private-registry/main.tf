# https://github.com/ssbostan/terraform-awesome

resource "docker_image" "private_image" {
  name = "localhost:5000/private_image:latest"
}
