# https://github.com/ssbostan/terraform-awesome
resource "kubernetes_pod_tolerations" "nginx" {
  metadata {
    name = "nginx"
    labels = {
      "app.kubernetes.io/name"       = "nginx"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }
  spec {
    containers {
      name = "nginx"
      image = "nginx:latest"
        tolerations {
          key = "example-key"
          operator = "Exists"
          effect = "NoSchedule"
        }
    }      
  }
}