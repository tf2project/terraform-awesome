# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_deployment" "nginx-deployment" {
  metadata {
    name      = "nginx-deployment"
    namespace = "default"
    labels = {
      "app.kubernetes.io/name"       = "nginx"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        "app.kubernetes.io/name"       = "nginx"
        "app.kubernetes.io/created-by" = "terraform-awesome"
      }
    }
    template {
      metadata {
        labels = {
          "app.kubernetes.io/name"       = "nginx"
          "app.kubernetes.io/created-by" = "terraform-awesome"
        }
      }
      spec {
        container {
          image = "nginx:1.21.6"
          name  = "nginx-deployment"
        }
      }
    }
    strategy {
      type = "RollingUpdate"
      rolling_update {
        max_surge       = 1
        max_unavailable = 1
      }
    }
  }
}
