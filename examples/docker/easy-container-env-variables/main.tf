# https://github.com/ssbostan/terraform-awesome

resource "docker_container" "mysql_container" {
  name  = "mysql_container"
  image = "mysql:latest"
  env = [
    "MYSQL_ROOT_PASSWORD=test",
    "MYSQL_DATABASE=test",
    "MYSQL_USER=test",
    "MYSQL_PASSWORD=test"
  ]
}
