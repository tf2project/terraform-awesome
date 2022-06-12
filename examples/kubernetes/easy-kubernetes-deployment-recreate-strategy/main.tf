# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_deployment" "my-deployment" {
  metadata {
    name      = "terraform-deployment"
    namespace = var.deployment_namespace
    labels = {
      app = var.app_label
    }
  }
  spec {
    replicas = var.replicas_number
    selector {
      match_labels = {
        app = var.app_label
      }
    }
    template {
      metadata {
        labels = {
          app = var.app_label
        }
      }
      spec {
        container {
          image = "nginx:1.21.6"
          name  = var.container_name
        }
      }
    }
    strategy {
      type = "Recreate"
    }
  }
}