# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_service_account" "simple_service_account" {
  metadata {
    generate_name = "simple-service-account"
    labels = {
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }
  secret {
    name = kubernetes_secret.simple_service_account_secret.metadata.0.name
  }
  automount_service_account_token = false
}

resource "kubernetes_secret" "simple_service_account_secret" {
  metadata {
    name = "simple-service-account"
  }
}
