# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_secret" "simple-secret" {
  metadata {
    name      = "simple-secret"
    namespace = "default"
    labels = {
      "app.kubernetes.io/name"       = "simple-secret"
      "app.kubenetes.io/type"        = "secret"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }
  data = {
    simple-secret = "secret-text"
  }
}
