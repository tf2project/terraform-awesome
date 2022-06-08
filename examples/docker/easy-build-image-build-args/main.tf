# https://github.com/ssbostan/terraform-awesome

resource "docker_image" "sample_image" {
  name = "sample_image"
  build {
    path = "."
    tag  = ["sample_image:latest"]
    build_arg = {
      USER  = "Saeid"
      CLASS = "DevOps"
    }
  }
}