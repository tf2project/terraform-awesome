# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_pod" "nginx" {
  metadata {
    name = "nginx"
    labels = {
      "app.kubernetes.io/name"       = "nginx"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }

  spec {
    container {
      name  = "nginx"
      image = "nginx:latest"
    }
    service_account_name            = kubernetes_service_account.terraform-awesome.metadata.0.name
    automount_service_account_token = false
  }

}