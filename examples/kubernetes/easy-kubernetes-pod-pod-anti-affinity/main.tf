# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_pod" "pod_pod_anti_affinity" {
  metadata {
    name      = "pod-pod-anti-affinity"
    namespace = "default"
    labels = {
      "app.kubernetes.io/name"       = "pod-pod-anti-affinity"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }
  spec {
    affinity {
      pod_anti_affinity {
        preferred_during_scheduling_ignored_during_execution {
          weight = 100

          pod_affinity_term {
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
    }

    container {
      name  = "pod-pod-anti-affinity"
      image = "k8s.gcr.io/pause:2.0"
    }
  }
}
