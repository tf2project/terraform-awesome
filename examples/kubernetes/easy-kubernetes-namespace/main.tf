# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_namespace" "nginx" {
  metadata {
    name = "terraform-namespace"
    labels = {
      "app.kubernetes.io/name"       = "nginx"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }
}


