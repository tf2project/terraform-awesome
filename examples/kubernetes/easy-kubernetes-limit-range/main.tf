resource "kubernetes_limit_range" "limitrange" {
  metadata {
    name      = "limitrange"
    namespace = "default"
    labels = {
      "app.kubernetes.io/name"       = "limit-range"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }
  spec {
    limit {
      type = "Container "
      max = {
        cpu    = "500m"
        memory = "1024Mi"
      }
      default = {
        cpu    = "200m"
        memory = "500Mi"
      }
    }
  }
}
