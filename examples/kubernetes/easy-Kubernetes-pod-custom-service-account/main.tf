# https://github.com/ssbostan/terraform-awesome
resource "kubernetes_service_account" "nginx" {
  metadata {
    name = "terraform-awesome"
    namespace = "default"
    labels = {
      "app.kubernetes.io/name"       = "nginx"
      "app.kubernetes.io/created-by" = "terraform-awesome"
  }
    secret {
      name = "${kubernetes_secret.example.metadata.0.name}"
    }
  }
  spec {
    container {
      name  = "nginx"
      image = "nginx:latest"
    }
    resource "kubernetes_secret" "nginx" {
      metadata {
        name = "terraform-awesome"
        namespace = "default"
      }
    }    
  }
}