# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_service" "nginx_svc" {
  metadata {
    name      = "nginx"
    namespace = "default"
    labels = {
      "app.kubernetes.io/name"       = "nginx"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }
  spec {
    type = "ClusterIP"
    selector = {
      app = "nginx"
    }
    port {
      port        = 80
      target_port = 80
    }
  }
}
