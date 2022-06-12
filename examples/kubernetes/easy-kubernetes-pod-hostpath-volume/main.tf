# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_persistent_volume" "my_pv" {
  metadata {
    name = "terraform-pv"

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


resource "kubernetes_pod" "mypod" {
  metadata {
    name      = "terraform-pod"
    namespace = "ingress-nginx"
  }

  spec {
    container {
      image = "nginx:1.21.6"
      name  = "terraform-test"
      volume_mount {
        mount_path = "/data"
        name       = kubernetes_persistent_volume.my_pv.metadata[0].name
      }
    }
    volume {
      name = kubernetes_persistent_volume.my_pv.metadata[0].name
    }
  }
}

