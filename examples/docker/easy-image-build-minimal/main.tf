# https://github.com/ssbostan/terraform-awesome

resource "docker_image" "simple_image" {
  name = "simple_image"
  build {
    path = "app"
    tag  = ["simple_image:latest"]
    label = {
      "app.docker.io/name"       = "nginx"
      "app.docker.io/created-by" = "terraform-awesome"
    }
  }
}
