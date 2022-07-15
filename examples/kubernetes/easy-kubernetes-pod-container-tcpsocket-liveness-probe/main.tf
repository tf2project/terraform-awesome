# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_pod" "nginx_tcp_liveness" {
  metadata {
    name      = "nginx-tcp-liveness"
    namespace = "default"
    labels = {
      "app.kubernetes.io/name"       = "nginx-tcp-liveness"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }
  spec {
    container {
      name  = "nginx-tcp-liveness"
      image = "nginx:latest"
      liveness_probe {
        tcp_socket {
          port = 80
        }
        initial_delay_seconds = 30
        timeout_seconds = 10
        period_seconds = 10
        failure_threshold = 3
      }
      port {
        name           = "http"
        protocol       = "TCP"
        container_port = 80
      }
      port {
        name           = "https"
        protocol       = "TCP"
        container_port = 443
      }
    }
  }
}

