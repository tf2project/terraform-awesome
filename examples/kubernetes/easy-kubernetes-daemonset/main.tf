# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_daemonset" "nginx" {
  metadata {
    name      = "terraform-awesome"
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
        container {
          image = "nginx:latest"
          name  = "nginx"
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

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }

          liveness_probe {
            http_get {
              path = "/"
              port = 80

              http_header {
                name  = "X-Custom-Header"
                value = "Awesome"
              }
            }

            initial_delay_seconds = 3
            period_seconds        = 3
          }

        }
      }
    }
  }
}

