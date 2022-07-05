# https://github.com/ssbostan/terraform-awesome

resource "docker_volume" "redis_data" {
  name = "redis_data"
}

resource "docker_container" "redis_container" {
  name  = "redis_container"
  image = "redis:latest"
  volumes {
    volume_name    = docker_volume.redis_data.name
    container_path = "/data"
    read_only      = false
  }
}
