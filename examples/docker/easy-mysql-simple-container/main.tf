# https://github.com/ssbostan/terraform-awesome
resource "docker_container" "mysql" {
  name  = "mysql"
  image = docker_image.mysql.name
  env = [
    "MYSQL_ROOT_PASSWORD=test",
    "MYSQL_PASSWORD=test",
    "MYSQL_USER=test",
    "MYSQL_DATABASE=test"
  ]
  volumes {
    container_path = "/var/lib/mysql"
    host_path      = "/my/own/datadir"

  }
  ports {
    internal = "3306"
    external = "3306"
  }
}
resource "docker_image" "mysql" {
  name = "mysql"
}

