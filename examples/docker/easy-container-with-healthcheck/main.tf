# https://github.com/ssbostan/terraform-awesome

resource "docker_image" "simple_app" {
  name = "simple_app"
  build {
    path = "./app/"
    tag  = ["simple_app:latest"]
    build_arg = {
      NAME = "Terraform Awesome"
    }
  }
}

resource "docker_container" "simple_app" {
  name  = "simple_app"
  image = docker_image.simple_app.latest
  healthcheck {
    test = ["CMD", "curl", "-f", "http://localhost:5000"]
  }
}
