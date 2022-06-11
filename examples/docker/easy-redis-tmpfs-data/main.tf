# https://github.com/ssbostan/terraform-awesome

resource "docker_image" "redis_image" {
  name = "redis:latest"
}
resource "docker_volume" "simple_tmpfs_volume" {
  name   = "simple_tmpfs_volume"
  driver = "local"
  driver_opts = {
    type : "tmpfs"
    device : "tmpfs"
    o : "size=100m,uid=1000"
  }
  labels {
    label = "volume.docker.com/created-by"
    value = "Terraform Awesome"
  }
}
resource "docker_container" "redis_container" {
  name    = "redis_container"
  image   = docker_image.redis_image.name
  command = ["redis-server", "--appendonly yes"]
  ports {
    internal = 6379
    external = 6379
    ip       = "0.0.0.0"
  }
  memory     = 1024
  cpu_shares = 2

  volumes {
    volume_name    = docker_volume.simple_tmpfs_volume.name
    container_path = "/data"
    read_only      = false
  }
  labels {
    label = "container.docker.com/created-by"
    value = "Terraform Awesome"
  }
}

