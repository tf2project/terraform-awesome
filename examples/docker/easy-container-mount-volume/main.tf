# https://github.com/ssbostan/terraform-awesome

resource "docker_volume" "persistent_vol" {
  name = "nginx_data"
}

resource "docker_image" "nginx_image" {
  name = "nginx:latest"
}

resource "docker_container" "nginx_container" {
  image = docker_image.nginx_image.name
  name  = "nginx_container"
  volumes {
    volume_name    = docker_volume.persistent_vol.name
    container_path = "/data"
    read_only      = false
  }
}
