# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_pod" "nginx" {
  metadata {
    name      = "nginx"
    namespace = "default"
    labels = {
      "app.kubernetes.io/name"       = "nginx"
      "app.kubernetes.io/created-by" = "terraform_awesome"
    }
  }
  spec {
    container {
      name  = "nginx"
      image = "nginx:latest"
    }
    host_aliases {
      hostnames = ["yourdomain.com"]
      ip        = "127.0.0.1"
    }
    host_aliases {
      hostnames = ["cloudflare"]
      ip        = "1.1.1.1"
    }
  }
}