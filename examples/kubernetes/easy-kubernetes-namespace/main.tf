# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_namespace" "namespace_awesome" {
  metadata {
    annotations = {
      name = "terraform-awsome-namespace"
    }

    labels = {
      "app.kubernetes.com/name"      = "namespace_awesome"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }

    name = "terraform-awsome-namespace"
  }
}

