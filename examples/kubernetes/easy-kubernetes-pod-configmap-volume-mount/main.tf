resource "kubernetes_config_map" "awsome-nginx-config" {
  metadata {
    name      = "awsome-nginx-configmap"
  }

  data {
    "awsome-nginx-config_file.yaml"  = "${file("${path.module}/awsome-nginx-config_file.yaml")}"
  }
}

resource "kubernetes_pod" "awsome-nginx" {
  metadata {
    name = "awsome-nginx-configmap"
    namespace = "default"
    labels = {
      "app.kubernetes.io/name"       = "awsome-nginx-configmap"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }
  spec {
    container {
      name = "awsome-nginx-configmap"
      image = "nginx:latest"
      command = ["cat", "/etc/nginx/nginx.conf"]
      volume_mount {
        mount_path = "/etc/nginx"
        name = "awesome_volume_mount"
      }
    }
    volume {
      name = "awesome_volume_mount"
      config_map {
        name = "awsome-nginx-config"
        
      }
    }
  }
}