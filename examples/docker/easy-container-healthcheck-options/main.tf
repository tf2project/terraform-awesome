# https://github.com/ssbostan/terraform-awesome

resource "docker_image" "flask_app_image" {
  name = "flaskapp:latest"
  build {
    path = "app"
    tag  = ["flaskapp:latest"]
  }
}

resource "docker_container" "flask_app_container" {
  name  = "flaskapp"
  image = docker_image.flask_app_image.latest
  healthcheck {
    test         = ["CMD", "curl", "-f", "http://localhost:5000"]
    retries      = 2
    interval     = "3s"
    timeout      = "3s"
    start_period = "5s"
  }
}
