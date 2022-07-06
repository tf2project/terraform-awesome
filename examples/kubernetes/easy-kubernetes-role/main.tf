# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_role" "example" {
  metadata {
    name      = "terraform-example"
    namespace = "default"
    labels = {
      "app.kubernetes.io/name"       = "terraform-example"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }
  rule {
    api_groups = ["apps"]
    resources  = ["deployments"]
    verbs      = ["get", "list"]
  }
}