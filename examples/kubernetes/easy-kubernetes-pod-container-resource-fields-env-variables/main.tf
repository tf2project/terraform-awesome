# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_pod" "nginx_pod" {
  metadata {
    name      = "nginx"
    namespace = "default"
    labels = {
      "app.kubernetes.io/name"       = "nginx"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }

  spec {
    container {
      image = "nginx:latest"
      name  = "nginx"

      env {
        name  = "environment"
        value = "test"
      }

      port {
        container_port = 80
      }
    }
  }
}
