# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_pod" "pod_pod_affinity" {
  metadata {
    name      = "pod-pod-affinity"
    namespace = "default"
    labels = {
      "app.kubernetes.io/name"       = "pod-pod-affinity"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }

  spec {
    affinity {
      pod_affinity {
        required_during_scheduling_ignored_during_execution {
          label_selector {
              match_expressions {
                key      = "app.kubernetes.io/created-by"
                operator = "In"
                values   = ["terraform-awesome"]
              }
          }

          topology_key = "kubernetes.io/hostname"
        }
      }
    }

    container {
      name  = "pod-pod-affinity"
      image = "k8s.gcr.io/pause:2.0"
    }
  }
}
