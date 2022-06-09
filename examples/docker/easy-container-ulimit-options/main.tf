# https://github.com/ssbostan/terraform-awesome

resource "docker_image" "redis_image" {
  name = "redis:latest"
}

resource "docker_container" "redis_container" {
  name  = "redis_container"
  image = docker_image.redis_image.name
  ports {
    internal = 6379
    external = 6379
  }
  ulimit {
    name = "core"
    soft = 1
    hard = 2
  }
  ulimit {
    name = "nofile"
    soft = 20000
    hard = 40000
  }
  ulimit {
    name = "cpu"
    soft = 2
    hard = 3
  }
  ulimit {
    name = "memlock"
    soft = 100
    hard = 200
  }
}
