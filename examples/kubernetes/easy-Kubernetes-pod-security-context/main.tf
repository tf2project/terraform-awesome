# https://github.com/ssbostan/terraform-awesome
resource "kubernetes_deployment" "nginx" {
  metadata {
    name = "nginx"
    namespace = "default"

    labels = {
      "app.kubernetes.io/name"       = "nginx"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }

  spec {
    selector {
      match_labels = {
        name = "nginx"
      }
    }

    template {
      metadata {
        labels = {
          name = "nginx"
        }
      }

      spec {
        security_context {
          fs_group = 100
        }

        container {
          image = "nginx:latest"
          name  = "nginx"
        }
      }
    }
  }
  timeouts {
    create = "30s"
  }
}