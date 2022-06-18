# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_replication_controller" "nginx" {
  metadata {
    name = "nginx"
    labels = {
      "app.kubernetes.io/name"       = "nginx"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }
  spec {
    selector = {
      "app.kubernetes.io/name"       = "nginx"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
    replicas = 3
    template {
      metadata {
        labels = {
          "app.kubernetes.io/name"       = "nginx"
          "app.kubernetes.io/created-by" = "terraform-awesome"
        }
      }
      spec {
        container {
          name  = "nginx"
          image = "nginx:1.21"
        }
      }
    }
  }
}
