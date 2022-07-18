resource "kubernetes_horizontal_pod_autoscaler_v1" "pod_auto_scaler" {
  metadata {
    name = "nginx-auto-scaler"
    labels = {
      "app.kubernetes.io/name"       = "nginx"
      "app.kubernetes.io/created-by" = "terraform-awesome"

    }
  }

  spec {
    max_replicas = 10
    min_replicas = 5

    scale_target_ref {
      kind = "Deployment"
      name = "nginx"
      api_version = "apps/v1"
    }
  }
}

