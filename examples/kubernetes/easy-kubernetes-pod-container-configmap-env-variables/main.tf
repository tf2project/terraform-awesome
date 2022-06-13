resource "kubernetes_config_map" "nginx_configmap" {
  metadata {
    name = "nginx-configmap"
  }

  data = {
    TEST = "TEST"
  }
}

resource "kubernetes_pod" "nginx_pod" {
  metadata {
    name = "nginx"
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
