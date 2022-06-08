# https://github.com/ssbostan/terraform-awesome

resource "docker_image" "redis_image" {
  name = "redis:latest"
}

resource "docker_volume" "shared_volume" {
  name = var.redis_volume_name
}

resource "docker_container" "redis_container" {
  name  = "redis_container"
  image = docker_image.redis_image.name

  mounts {
    source = docker_volume.shared_volume.name
    target = "/data"
    type   = "volume"
  }
}

