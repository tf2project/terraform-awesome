# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_pod" "busybox_startup" {
  metadata {
    name      = "busyboxstartup"
    namespace = "default"
    labels = {
      "app.kubernetes.io/name"       = "busyboxstartup"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }
  spec {
    container {
      name  = "busyboxstartup"
      image = "k8s.gcr.io/busybox"
      args  = ["/bin/sh", "-c", "touch /tmp/healthy; sleep 30; rm -f /tmp/healthy; sleep 600"]
      startup_probe {
        initial_delay_seconds = 5
        period_seconds        = 5
        timeout_seconds       = 1
        failure_threshold     = 3
        success_threshold     = 1
        exec {
          command = ["cat", "/tmp/healthy"]
        }
      }
    }
  }
}
