# https://github.com/ssbostan/terraform-awesome

resource "docker_image" "nginx_image" {
  name = "nginx:latest"
}

resource "docker_container" "nginx_container" {
  name  = "nginx_container"
  image = docker_image.nginx_image.name
  capabilities {
    add  = ["CAP_NET_RAW", "CAP_SYS_TIME", "CAP_CHOWN", "CAP_SETGID", "CAP_SETUID"]
    drop = ["ALL"]
  }
}
