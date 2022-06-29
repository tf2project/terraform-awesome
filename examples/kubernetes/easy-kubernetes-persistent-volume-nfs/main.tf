# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_persistent_volume" "pv" {
  metadata {
    name = "terraform-example"
    labels = {
      "app.kubernetes.io/name"       = "pv"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }

  spec {
    capacity = {
      storage = "2Gi"
    }
    access_modes = ["ReadWriteMany"]
    persistent_volume_source {
      nfs {
        server    = "192.168.63.88"
        path      = "/nfs/vol1"
        read_only = false
      }
    }
  }
}
