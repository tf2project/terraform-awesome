# https://github.com/ssbostan/terraform-awesome
resource "docker_volume" "db_data" {}
resource "docker_network" "wordpress_net" {
  name = "wordpress_net"
}
resource "docker_container" "db" {
  name         = "db"
  image        = "mysql"
  restart      = "always"
  network_mode = "wordpress_net"
  env = [
    "MYSQL_ROOT_PASSWORD=test",
    "MYSQL_PASSWORD=test",
    "MYSQL_USER=test",
    "MYSQL_DATABASE=test"
  ]
  mounts {
    type   = "volume"
    target = "/var/lib/mysql"
    source = "db_data"
  }
  ports {
    internal = "3306"
    external = "3306"
  }
}
resource "docker_container" "wordpress" {
  name         = "wordpress"
  image        = "wordpress:latest"
  restart      = "always"
  network_mode = "wordpress_net"
  env = [
    "WORDPRESS_DB_HOST=db:3306",
    "WORDPRESS_DB_NAME=test",
    "WORDPRESS_DB_PASSWORD=test"
  ]
  ports {
    internal = "80"
    external = "8080"
  }
}