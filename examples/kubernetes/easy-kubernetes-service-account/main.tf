# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_service_account" "terraform-awesome" {

  metadata {
    generate_name = "terraform-awesome-"
    labels = {
      "app.kubernetes.io/name"       = "awesome-account"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }

  secret {
    name = kubernetes_secret.terraform-awesome.metadata.0.name
  }

  automount_service_account_token = false
}

resource "kubernetes_secret" "terraform-awesome" {

  metadata {
    name = "awesome"
  }

}
