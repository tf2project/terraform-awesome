# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_pod" "nginx" {
  metadata {
    name      = "nginx"
    namespace = "default"
    labels = {
      "app.kubernetes.io/name"       = "nginx"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }
  spec {
    container {
      name  = "nginx"
      image = "nginx:latest"
      port {
        name           = "https"
        protocol       = "TCP"
        container_port = 443
      }
      readiness_probe {
        tcp_socket {
          port = 443
        }
        initial_delay_seconds = 5
        period_seconds        = 5
      }
    }
  }
}