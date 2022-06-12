# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_pod" "pod_env_example" {
  metadata {
    name      = "terraform-test"
    namespace = "ingress-nginx"
  }
  spec {
    container {
      image = "nginx:1.21.6"
      name  = "terraform-test"
      env {
        name  = "env"
        value = "prod"
      }
    }
  }
}