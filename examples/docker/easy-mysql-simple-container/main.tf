# https://github.com/ssbostan/terraform-awesome

resource "random_pet" "mysql_name" {
  separator = ""
  length    = 1
}

resource "docker_image" "mysql_image" {
  name = "mysql:8"
}

resource "docker_container" "mysql_container" {
  name  = "mysql-${random_pet.mysql_name.id}"
  image = docker_image.mysql_image.name
  env   = toset(["MYSQL_ROOT_PASSWORD=root", "MYSQL_DATABASE=testing", "MYSQL_USER=test", "MYSQL_PASSWORD=test"])
  ports {
    internal = "3306"
    external = "3306"
  }
}
