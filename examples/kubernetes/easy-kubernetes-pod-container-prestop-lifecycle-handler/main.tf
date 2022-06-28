# https://github.com/ssbostan/terraform-awesome
resource "kubernetes_pod_container_prestop" "nginx" {
  metadata {
    name = "nginx"
    labels = {
      "app.kubernetes.io/name"       = "nginx"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }
  spec {
    container {
      name  = "nginx"
      image = "nginx:latest"
      lifecycle {
        pre_stop {
          exec {
            command = ["/bin/sh", "-c", "echo Hello from the prestop handler > /usr/share/message"]
          }
        }
      }
    }
  }
}