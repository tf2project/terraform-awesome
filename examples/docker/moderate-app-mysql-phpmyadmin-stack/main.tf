# https://github.com/ssbostan/terraform-awesome

resource "docker_volume" "mysql_data" {
  name = "mysql_data"
}

resource "docker_container" "mysql_container" {
  name  = "mysql"
  image = "mysql:latest"
  env = [
    "MYSQL_ROOT_PASSWORD=root",
    "MYSQL_DATABASE=test",
    "MYSQL_USER=test",
    "MYSQL_PASSWORD=test"
  ]
  volumes {
    volume_name    = docker_volume.mysql_data.name
    container_path = "/var/lib/mysql"
  }
}

resource "docker_container" "phpmyadmin_container" {
  name  = "phpmyadmin"
  image = "phpmyadmin/phpmyadmin:latest"
  env = [
    "PMA_ARBITRARY=1",
    "PMA_HOST=${docker_container.mysql_container.network_data[0].ip_address}",
    "PMA_USER=test",
    "PMA_PASSWORD=test"
  ]
  ports {
    internal = 80
    external = 8080
  }
}
