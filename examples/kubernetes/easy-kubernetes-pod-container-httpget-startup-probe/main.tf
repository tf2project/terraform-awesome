# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_pod" "startuphttp" {
  metadata {
    name      = "startuphttp"
    namespace = "default"
    labels = {
      "app.kubernetes.io/name"       = "startuphttp"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }
  spec {
    container {
      name  = "startuphttp"
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
        http_get {
          path = "/healthz"
          port = "startup-port"
          http_header {
            name  = "Custom-Header"
            value = "Awesome"
          }
        }
      }
    }
  }
}