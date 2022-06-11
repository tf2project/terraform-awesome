# https://github.com/ssbostan/terraform-awesome

resource "docker_image" "mysql_image" {
  name = "mysql:8"
}

resource "docker_container" "mysql_container" {
  name  = "mysql_container"
  image = docker_image.mysql_image.name
  env   = [
    "MYSQL_ROOT_PASSWORD=root",
    "MYSQL_DATABASE=testing", 
    "MYSQL_USER=test", 
    "MYSQL_PASSWORD=test"
  ]
  ports {
    internal = "3306"
    external = "3306"
  }
}
