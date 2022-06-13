# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_pod" "with_pod_affinity" {
  metadata {
    name = "with-pod-affinity"
    labels = {
      app = "test-app"
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
                key      = "app"
                operator = "In"
                values   = ["test-app"]
              }
            }

            topology_key = "kubernetes.io/hostname"
          }
        }
      }
    }

    container {
      name  = "with-pod-affinity"
      image = "k8s.gcr.io/pause:2.0"
    }
  }
}