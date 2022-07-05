# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_config_map" "nginx_configmap" {
  metadata {
    name      = "nginx-configmap"
    namespace = "default"
    labels = {
      "app.kubernetes.io/name"       = "nginx"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }

  data = {
    TEST = "TEST"
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
        config_map_ref {
          name = kubernetes_config_map.nginx_configmap.metadata[0].name
        }
      }

      port {
        container_port = 80
      }
    }
  }
}
