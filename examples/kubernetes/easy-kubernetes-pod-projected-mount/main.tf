# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_config_map" "nginx_configmap" {
  metadata {
    name      = "nginx-configmap"
    namespace = "default"
    labels = {
      "app.kubernetes.io/name"       = "nginx-configmap"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }

  data = {
    TEST = "TEST"
  }
}

resource "kubernetes_secret" "nginx_secret" {
  metadata {
    name      = "nginx-secret"
    namespace = "default"
    labels = {
      "app.kubernetes.io/name"       = "nginx-secret"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }

  data = {
    username = "admin"
    password = "admin"
  }
}

resource "kubernetes_pod" "nginx_projected_volume" {
  metadata {
    name      = "nginx-projected-volume"
    namespace = "default"
    labels = {
      "app.kubernetes.io/name"       = "nginx-projected-volume"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }

  spec {
    container {
      image = "nginx:latest"
      name  = "nginx-projected-volume"

      port {
        container_port = 80
      }
      volume_mount {
        name       = "projected-volume"
        mount_path = "/project"
      }
    }
    volume {
      name = "projected-volume"
      projected {
        sources {

          config_map {
            name = kubernetes_config_map.nginx_configmap.metadata[0].name
          }

          secret {
            name = kubernetes_secret.nginx_secret.metadata[0].name
          }
        }
      }
    }
  }
}
