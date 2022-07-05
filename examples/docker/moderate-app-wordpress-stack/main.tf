# https://github.com/ssbostan/terraform-awesome

resource "docker_network" "wordpress_backend_network" {
  name            = "wordpress_backend_network"
  driver          = "bridge"
  check_duplicate = true
}

resource "docker_network" "wordpress_frontend_network" {
  name            = "wordpress_frontend_network"
  driver          = "bridge"
  check_duplicate = true
}

resource "docker_volume" "mysql_data" {
  name = "mysql_data"
}

resource "docker_volume" "wordpress_data" {
  name = "wordpress_data"
}

resource "docker_container" "mysql_container" {
  name        = "mysql"
  image       = "mysql:8"
  restart     = "unless-stopped"
  memory      = 1024
  memory_swap = 2048
  env = [
    "MYSQL_ROOT_PASSWORD=hardrootpassword",
    "MYSQL_DATABASE=wordpress",
    "MYSQL_USER=wordpress",
    "MYSQL_PASSWORD=hardwordpresspassword"
  ]
  volumes {
    volume_name    = docker_volume.mysql_data.name
    container_path = "/var/lib/mysql"
  }
  networks_advanced {
    name = docker_network.wordpress_backend_network.name
  }
}

resource "docker_container" "wordpress_container" {
  name        = "wordpress"
  image       = "wordpress:latest"
  restart     = "unless-stopped"
  memory      = 1024
  memory_swap = 2048
  env = [
    "WORDPRESS_DB_HOST=${docker_container.mysql_container.name}",
    "WORDPRESS_DB_NAME=wordpress",
    "WORDPRESS_DB_USER=wordpress",
    "WORDPRESS_DB_PASSWORD=hardwordpresspassword"
  ]
  networks_advanced {
    name = docker_network.wordpress_backend_network.name
  }
  networks_advanced {
    name = docker_network.wordpress_frontend_network.name
  }
  volumes {
    volume_name    = docker_volume.wordpress_data.name
    container_path = "/var/www/html"
  }
  ports {
    internal = 80
    external = 80
  }
}
