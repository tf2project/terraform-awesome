# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_cluster_role_binding" "example_cluster_role_binding" {
  metadata {
    name = "example_cluster_role_binding"
    labels = {
      "app.kubernetes.io/name"       = "example_cluster_role_binding"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "cluster-admin"
  }
  subject {
    kind      = "User"
    name      = "admin"
    api_group = "rbac.authorization.k8s.io"
  }
}