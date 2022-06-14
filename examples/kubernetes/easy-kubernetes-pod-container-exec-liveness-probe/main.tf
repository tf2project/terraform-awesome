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
      readiness_probe {
        exec {
          command = [ "ls -lhtar /var/www/html" ]
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
