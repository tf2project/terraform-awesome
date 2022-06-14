# https://github.com/ssbostan/terraform-awesome

resource "docker_network" "backend" {
  name = "backend"
}

resource "docker_volume" "mysql_data" {
  name   = "mysql_data"
  driver = "local"
}

resource "docker_volume" "wordpress_data" {
  name   = "wordpress_data"
  driver = "local"
}

resource "docker_container" "mysql_container" {
  name    = "db"
  image   = "mysql:latest"
  restart = "always"
  command = ["--default-authentication-plugin=mysql_native_password"]
  env = [
    "MYSQL_DATABASE=wordpress",
    "MYSQL_ROOT_PASSWORD=somewordpress",
    "MYSQL_USER=wordpress",
    "MYSQL_PASSWORD=wordpress"
  ]
  networks_advanced {
    name = docker_network.backend.name
  }
  volumes {
    host_path      = abspath("wordpress/conf")
    container_path = "/etc/mysql/conf.d"
  }
  volumes {
    volume_name    = docker_volume.mysql_data.name
    container_path = "/var/lib/mysql"
  }
}

resource "docker_container" "wordpress_container" {
  name    = "wordpress"
  image   = "wordpress:php7.4-fpm-alpine"
  restart = "always"
  env = [
    "MYSQL_DATABASE=wordpress",
    "MYSQL_ROOT_PASSWORD=somewordpress",
    "MYSQL_USER=wordpress",
    "MYSQL_PASSWORD=wordpress",
    "WORDPRESS_DB_HOST=db:3306",
    "WORDPRESS_DB_USER=wordpress",
    "WORDPRESS_DB_PASSWORD=wordpress",
    "WORDPRESS_DB_NAME=wordpress",
    "WORDPRESS_TABLE_PREFIX=wp_"
  ]
  networks_advanced {
    name = docker_network.backend.name
  }
  volumes {
    host_path      = abspath("wordpress/uploads.ini")
    container_path = "/usr/local/etc/php/conf.d/uploads.ini"
  }
  volumes {
    volume_name    = docker_volume.wordpress_data.name
    container_path = "/var/www/html"
  }
  depends_on = [docker_container.mysql_container]
}
resource "docker_container" "nginx_container" {
  name    = "webserver"
  image   = "nginx:1.15.12-alpine"
  restart = "always"
  env = [
    "MYSQL_DATABASE=wordpress",
    "MYSQL_ROOT_PASSWORD=somewordpress",
    "MYSQL_USER=wordpress",
    "MYSQL_PASSWORD=wordpress"
  ]
  networks_advanced {
    name = docker_network.backend.name
  }
  ports {
    internal = "80"
    external = "80"
  }
  volumes {
    host_path      = abspath("wordpress/nginx-conf")
    container_path = "/etc/nginx/conf.d"
  }
  volumes {
    volume_name    = docker_volume.wordpress_data.name
    container_path = "/var/www/html"
  }
  depends_on = [docker_container.wordpress_container]
}
