# https://github.com/ssbostan/terraform-awesome

resource "docker_volume" "persistent-vol" {
  name = "nginx-data"
}

resource "docker_image" "nginx_image" {
  name = "nginx:latest"
}

resource "docker_container" "nginx_container" {
  image = docker_image.nginx_image.name
  name = "nginx"
  volumes {
    volume_name = docker_volume.persistent-vol.name
    container_path = "/data"
    read_only = false
  }
}
