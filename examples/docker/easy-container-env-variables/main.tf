# https://github.com/ssbostan/terraform-awesome

resource "docker_image" "redis_image" {
  name = "redis:latest"
}

resource "docker_container" "redis_container" {
  name       = "redis_container"
  image      = docker_image.redis_image.name
  memory     = 1024
  cpu_shares = 2
  env        = ["REDIS_ARGS=--requirepass redis-stack"]
}
