# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_role_binding" "example" {
  metadata {
    name      = "example"
    namespace = "default"
    labels = {
      "app.kubernetes.io/name"       = "example"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = "admin"
  }
  subject {
    kind      = "User"
    name      = "admin"
    api_group = "rbac.authorization.k8s.io"
  }
}