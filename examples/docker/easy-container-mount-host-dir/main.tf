# https://github.com/ssbostan/terraform-awesome


resource "docker_image" "nginx_image" {
  name = "nginx:latest"
}


resource "docker_container" "nginx_container" {
  name  = "nginx_container"
  image = docker_image.nginx_image.name


  volumes {
    host_path      = var.nginx_host_volume
    container_path = var.nginx_container_volume_mount
  }
}


