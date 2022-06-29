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
      image = "nginx:latest"
      name  = "nginx"
      stdin = true
      tty   = true
    }
  }
}
