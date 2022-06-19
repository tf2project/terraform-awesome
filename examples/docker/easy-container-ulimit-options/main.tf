# https://github.com/ssbostan/terraform-awesome

resource "docker_container" "alpine_container" {
  name    = "alpine_container"
  image   = "alpine:latest"
  command = ["sleep", "1000"]
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
