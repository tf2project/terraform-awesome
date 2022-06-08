# https://github.com/ssbostan/terraform-awesome

resource "docker_volume" "foo" {
  name   = "foo"
  driver = "local"
  driver_opts = {
    type : "btrfs"
    device: "/dev/sda4"
    o: "size=100m,uid=1000"
  }
  labels {
    label = "author"
    value = "Terraform Awesome"
  }
}
