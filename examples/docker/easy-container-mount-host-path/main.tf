# https://github.com/ssbostan/terraform-awesome

resource "docker_container" "redis_container" {
  name  = "redis_container"
  image = "redis:latest"
  volumes {
    host_path      = "/opt/redis/data"
    container_path = "/data"
    read_only      = false
  }
}
