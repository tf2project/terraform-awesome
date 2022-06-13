# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_replication_controller" "rc_sample" {
  metadata {
    name = "sample"
    labels = {
      test = "sampleApp"
    }
  }

  spec {
    selector = {
      test = "sampleApp"
    }
    replicas = 3
    template {
      metadata {
        labels = {
          test = "sampleApp"
        }
        annotations = {
          "key1" = "value1"
        }
      }

      spec {
        container {
          image = "nginx:1.21.6"
          name  = "nginx-sample"

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
        }
      }
    }
  }
}