# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_horizontal_pod_autoscaler_v2" "pod_auto_scaler_v2" {
  metadata {
    name = "nginx"
    labels = {
      "app.kubernetes.io/name"       = "nginx"
      "app.kubernetes.io/created-by" = "terraform-awesome"

    }
  }

  spec {
    min_replicas = 2
    max_replicas = 10

    scale_target_ref {
      kind        = "Deployment"
      name        = "nginx"
      api_version = "apps/v1"
    }

    metric {
      type = "External"
      external {
        metric {
          name = "latency"
          selector {
            match_labels = {
              "app.kubernetes.io/name"       = "nginx"
              "app.kubernetes.io/created-by" = "terraform-awesome"
            }
          }
        }
        target {
          type  = "Value"
          value = "100"
        }
      }
    }
    metric {
      type = "Resource"
      resource {
        name = "cpu"
        target {
          type                = "Utilization"
          average_utilization = "50"
        }
      }
    }
    behavior {
      scale_down {
        stabilization_window_seconds = 30
        select_policy                = "Min"
        policy {
          period_seconds = 20
          type           = "Pods"
          value          = 4
        }

        policy {
          period_seconds = 31
          type           = "Percent"
          value          = 10
        }
      }
      scale_up {
        stabilization_window_seconds = 60
        select_policy                = "Max"
        policy {
          period_seconds = 18
          type           = "Percent"
          value          = 10
        }
        policy {
          period_seconds = 60
          type           = "Pods"
          value          = 5
        }
      }
    }
  }
}

