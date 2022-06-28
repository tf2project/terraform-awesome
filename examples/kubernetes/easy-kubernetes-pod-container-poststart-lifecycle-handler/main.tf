# https://github.com/ssbostan/terraform-awesome
resource "kubernetes_pod_container_postart" "nginx" {
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
        post_start {
          exec {
            command = ["/bin/sh", "-c", "echo Hello from the postStart handler > /usr/share/message"]
          }
        }
      }
    }
  }
}