# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_pod" "nginx" {
  metadata {
    name      = "nginx"
    namespace = "default"
    labels = {
      "app.kubernetes.io/name"       = "nginx"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }
  spec {
    container {
      name    = "nginx"
      image   = "nginx:latest"
      command = ["/usr/sbin/nginx"]
      args    = ["-g", "daemon off;"]
    }
  }
}
