# https://github.com/ssbostan/terraform-awesome

resource "docker_image" "simple_flask_app" {
  name = "flaskapp"
  build {
    path = "app"
    tag  = ["flaskapp:latest"]
    build_arg = {
      "PYTHON_IMAGE" = "alpine"
      "TERRAFORM"    = "terraform-awesome"
    }
  }
}
