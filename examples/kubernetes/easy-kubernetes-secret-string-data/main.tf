# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_secret" "simple_k8s_secret" {
  metadata {
    name      = "simple-k8s-secret"
    namespace = "default"
    labels = {
      "app.kubernetes.io/name"       = "simple-k8s-secret"
      "app.kubenetes.io/type"        = "secret"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }
  data = {
    mykey = "myvalue"
  }
}
