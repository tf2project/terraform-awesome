# https://github.com/ssbostan/terraform-awesome

resource "random_pet" "container_name" {
  separator = ""
  length = 1
}

resource "docker_volume" "persistent-vol" {
  name = "nginx-data"
}

resource "docker_image" "nginx_image" {
  name = "nginx:latest"
}

resource "docker_container" "nginx_container" {
  image = docker_image.nginx_image.name
  name = "nginx-${random_pet.container_name.id}"
  volumes {
    volume_name = docker_volume.persistent-vol.name
    container_path = "/data"
    read_only = false
  }
}
