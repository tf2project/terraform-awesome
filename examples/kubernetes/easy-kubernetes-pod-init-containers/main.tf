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
    init_container {
      name  = "alpine-test"
      image = "alpine:latest"

      command = ["ping", "-c", "4", "8.8.8.8"]

    }

    container {
      name  = "nginx"
      image = "nginx:latest"

      port {
        container_port = 80
      }

    }
  }
}
