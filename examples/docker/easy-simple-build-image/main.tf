# https://github.com/ssbostan/terraform-awesome

resource "docker_image" "simple_image" {
  name = "simple_image"
  build {
    path = "./app/"
    tag  = ["simple_image:latest"]
    build_arg = {
      foo : "zoo"
    }
    label = {
      author : "Terraform Awesome"
    }
  }
}
