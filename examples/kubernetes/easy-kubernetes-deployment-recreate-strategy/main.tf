# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_deployment" "nginx_deployment" {
  metadata {
    name      = "terraform_deployment"
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
          name  = "nginx_deployment"
        }
      }
    }
    strategy {
      type = "Recreate"
    }
  }
}