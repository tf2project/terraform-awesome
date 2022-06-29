# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_secret" "nginx_secret" {
  metadata {
    name      = "nginx-secret"
    namespace = "default"
    labels = {
      "app.kubernetes.io/name"       = "nginx"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }

  data = {
    username = "admin"
    password = "admin"
  }
}

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

      env_from {
        secret_ref {
          name = kubernetes_secret.nginx_secret.metadata[0].name
        }
      }

      port {
        container_port = 80
      }
    }
  }
}
