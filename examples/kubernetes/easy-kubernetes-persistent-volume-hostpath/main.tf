# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_persistent_volume" "simple-pv" {
  metadata {
    name = "simple-pv"
    labels = {
      "app.kubernetes.io/name"       = "simple-pv"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }
  spec {
    access_modes = ["ReadWriteOnce"]
    capacity = {
      storage = "2Gi"
    }
    persistent_volume_reclaim_policy = "Recycle"
    persistent_volume_source {
      host_path {
        path = "/mnt/pv"
      }
    }

  }
}
