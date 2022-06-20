# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_service_account" "example" {
  metadata {
    name      = "terraform-example"
    namespace = "default"
    labels = {
      "app.kubernetes.io/name"       = "example"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }
  secret {
    name = kubernetes_secret.example.metadata.0.name
  }
}

resource "kubernetes_secret" "example" {
  metadata {
    name = "terraform-example"
  }
}

