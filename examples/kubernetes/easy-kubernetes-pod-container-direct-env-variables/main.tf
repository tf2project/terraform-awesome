# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_pod" "pod_env_example" {
  metadata {
    name      = "terraform-example"
    namespace = "default"
    labels = {
      "app.kubernetes.io/name"       = "nginx"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }
  spec {
    container {
      image = "nginx:1.21.6"
      name  = "terraform-example"
      env {
        name  = "env"
        value = "prod"
      }
    }
  }
}
