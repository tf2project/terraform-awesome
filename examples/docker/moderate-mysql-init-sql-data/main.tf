# https://github.com/ssbostan/terraform-awesome

resource "docker_network" "backend" {
  name = "backend"
}

resource "docker_container" "mysql_container" {
  name  = "mysql"
  image = "mysql:latest"
  env = [
    "MYSQL_ROOT_PASSWORD=rootpass",
    "MYSQL_DATABASE=test",
    "MYSQL_USER=test",
    "MYSQL_PASSWORD=test"
  ]
  networks_advanced {
    name = docker_network.backend.name
  }
    volumes {
    host_path      = abspath("init.sql")
    container_path = "/docker-entrypoint-initdb.d/init.sql"
  }
}
