# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_persistent_volume" "example_pv" {
  metadata {
    name      = "terraform-pv"
    namespace = "default"
    labels = {
      "app.kubernetes.io/name"       = "nginx"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }

  }
  spec {
    capacity = {
      storage = "10Gi"
    }
    access_modes = ["ReadWriteOnce"]
    persistent_volume_source {
      host_path {
        path = "/data"
        type = "Directory"
      }
    }
  }
}


resource "kubernetes_pod" "example_pod" {
  metadata {
    name      = "terraform-pod"
    namespace = "default"
    labels = {
      "app.kubernetes.io/name"       = "nginx"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }

  spec {
    container {
      image = "nginx:1.21.6"
      name  = "terraform-test"
      volume_mount {
        mount_path = "/data"
        name       = kubernetes_persistent_volume.example_pv.metadata[0].name
      }
    }
    volume {
      name = kubernetes_persistent_volume.example_pv.metadata[0].name
    }
  }
}
