# https://github.com/ssbostan/terraform-awesome

resource "docker_container" "mysql_container" {
  name  = "mysql_container"
  image = "mysql:latest"
  env = [
    "MYSQL_ROOT_PASSWORD=root",
    "MYSQL_DATABASE=test",
    "MYSQL_USER=test",
    "MYSQL_PASSWORD=test"
  ]
  volumes {
    host_path      = abspath("mysql")
    container_path = "/docker-entrypoint-initdb.d"
  }
}
