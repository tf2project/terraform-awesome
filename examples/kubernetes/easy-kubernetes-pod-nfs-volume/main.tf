# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_persistent_volume" "nfs_volume" {
  metadata {
    name = "nfs-volume"
    labels = {
      "app.kubernetes.io/name"       = "nfs_volume"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }
  spec {
    capacity = {
      storage = "1Gi"
    }
    access_modes = ["ReadWriteOnce"]
    persistent_volume_source {
      nfs {
        path      = "/mnt/nfs"
        server    = "0.0.0.0"
        read_only = false
      }
    }
  }
}