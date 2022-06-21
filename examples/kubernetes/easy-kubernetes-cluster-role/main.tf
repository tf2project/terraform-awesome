# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_cluster_role" "example_cluster_role" {
  metadata {
    name = "example_cluster_role"
    labels = {
      "app.kubernetes.io/name"       = "example_cluster_role"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }
  rule {
    api_groups = [""]
    resources  = ["namespaces", "pods"]
    verbs      = ["get", "list", "watch"]
  }
}