# https://github.com/ssbostan/terraform-awesome

resource "docker_image" "redis_image" {
  name = "redis:latest"
}

resource "docker_container" "redis_container" {
  name       = "redis_container"
  image      = docker_image.redis_image.name
  memory     = var.redis_memory
  cpu_shares = var.redis_cpu_shares
  env = ["REDIS_ARGS=${var.redis_ARGS}"]
}
