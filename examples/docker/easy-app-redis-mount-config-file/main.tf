# https://github.com/ssbostan/terraform-awesome

resource "docker_container" "redis_container" {
  name  = "redis_container"
  image = "redis:latest"
  command = [
    "redis-server",
    "/usr/local/etc/redis/redis.conf"
  ]
  ports {
    internal = 6379
    external = 6379
  }
  volumes {
    host_path      = abspath("redis.conf")
    container_path = "/usr/local/etc/redis/redis.conf"
  }
  volumes {
    host_path      = "/opt/redis/data"
    container_path = "/data"
  }
}
