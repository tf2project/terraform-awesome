# https://github.com/ssbostan/terraform-awesome

resource "docker_image" "test_image" {
  name = "terraformawesome/test"
}

resource "docker_container" "test_container" {
  name  = "test_container_001"
  image = docker_image.test_image.name
}
