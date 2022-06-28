# https://github.com/ssbostan/terraform-awesome

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
        mount_path = "/test-data"
        name       = "host-path-vol"
      }
    }
    volume {
      name = "host-path-vol"
      host_path {
        type = "DirectoryOrCreate"
        path = "/data"
      }
    }
  }
}
