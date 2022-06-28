# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_resource_quota" "terraform-awesome" {
  metadata {
    name      = "terraform-awesome"
    namespace = kubernetes_namespace.awesome-namespace.metadata.0.name
    labels = {
      "app.kubernetes.io/name"       = "resource_quota"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }

  spec {
    hard = {
      cpu     = 2
      memory  = "2Gi"
      pods    = 3
      secrets = 10
    }
  }
}

resource "kubernetes_namespace" "awesome-namespace" {
  metadata {
    annotations = {
      name = "terraform-awsome-namespace"
    }

    labels = {
      "app.kubernetes.com/name"      = "awesome-namespace"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }

    name = "terraform-awsome-namespace"
  }
}
