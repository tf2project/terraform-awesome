# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_pod" "startuptcpsocket" {
  metadata {
    name      = "startuphttp"
    namespace = "default"
    labels = {
      "app.kubernetes.io/name"       = "startuptcpsocket"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }
  spec {
    container {
      name  = "startuptcpsocket"
      image = "k8s.gcr.io/liveness"
      args  = ["/server"]
      port {
        name           = "startup-port"
        container_port = "8080"
        host_port      = "8080"
      }
      startup_probe {
        initial_delay_seconds = 3
        period_seconds        = 10
        timeout_seconds       = 1
        failure_threshold     = 30
        success_threshold     = 1
        tcp_socket {
          port = "startup-port"
        }
      }
    }
  }
}