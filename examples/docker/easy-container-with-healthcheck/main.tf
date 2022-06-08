# https://github.com/ssbostan/terraform-awesome

resource "docker_image" "docker-flask" {
  name = "docker-flask"
  build {
    path = "./app/"
    tag  = ["docker-flask:latest"]
    build_arg = {
      foo : "zoo"
    }
    label = {
      author : "Terraform Awesome"
    }
  }
}

resource "docker_container" "docker-flask" {
  name  = "docker-flask"
  image = docker_image.docker-flask.latest

  healthcheck {
    test = ["CMD", "curl", "-f", "http://localhost:5000"]
  }
}
