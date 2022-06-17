# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_secret" "secret_base64" {
  metadata {
    name      = "secret-base64"
    namespace = "default"
    labels = {
      "app.kubernetes.io/name"       = "secret-base64"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }
  data = {
    "mydata" = filebase64("${path.module}/mydata")
    }
}