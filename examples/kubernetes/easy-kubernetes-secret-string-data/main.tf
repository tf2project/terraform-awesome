# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_secret" "mysecret" {
  metadata {
    name      = "mysecret"
    namespace = "default"
    labels = {
      "app.kubernetes.io/name"       = "simple-secret"
      "app.kubenetes.io/type"        = "secret"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }
  data = {
    "secret_key" = "value"
  }
}
