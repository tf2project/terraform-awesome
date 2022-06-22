# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_pod" "nginx_glusterfs_volume" {
  metadata {
    name      = "nginx-glusterfs-volume"
    namespace = "default"
    labels = {
      "app.kubernetes.io/name"       = "nginx-glusterfs-volume"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }

  spec {
    container {
      image = "nginx:1.21.6"
      name  = "nginx-glusterfs-volume"
      volume_mount {
        name       = "terraform-example"
        mount_path = "/var/nginx"
        read_only  = false
      }
    }

    volume {
      name = "terraform-example"
      glusterfs {
        endpoints_name = "glusterfs-cluster"
        path           = "terraform-test"
        read_only      = false
      }
    }
  }
}
