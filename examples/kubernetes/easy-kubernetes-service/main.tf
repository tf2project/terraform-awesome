resource "kubernetes_service" "nginx_svc" {
  metadata {
    name = "nginx"
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
