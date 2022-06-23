# https://github.com/ssbostan/terraform-awesome

resource "docker_container" "redis_container" {
  name        = "redis_container"
  image       = "redis:latest"
  memory      = 1024
  memory_swap = 2048
  shm_size    = 64
  cpu_set     = "2-3,5"
  cpu_shares  = 1024
}
