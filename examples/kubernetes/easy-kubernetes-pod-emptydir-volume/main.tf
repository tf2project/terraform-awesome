# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_pod" "nginx" {
  metadata {
    name      = "nginx"
    namespace = "default"
    labels = {
      "app.kubernetes.io/name"       = "nginx"
      "app.kubernetes.io/created-by" = "terraform_awesome"
    }
  }
  spec {
    container {
      name  = "nginx"
      image = "nginx:latest"
      volume_mount {
        name       = "mydir"
        mount_path = "/data"
      }
    }
    volume {
      name = "mydir"
      empty_dir {}
    }
  }
}
