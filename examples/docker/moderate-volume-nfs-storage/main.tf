resource "docker_volume" "nfs_volume" {
  name   = "nfs_volume"
  driver = "local"
  driver_opts = {
    type   = "nfs"
    device = "/dev/nfs"
  }
}
