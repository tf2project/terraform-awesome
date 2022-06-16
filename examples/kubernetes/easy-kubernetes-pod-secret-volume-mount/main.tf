# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_pod" "nginx" {
  metadata {
    name = "nginx"
    labels = {
      "app.kubernetes.io/name"       = "nginx"
      "app.kubernetes.io/type"       = "pod"
      "app.kubernetes.io/created_by" = "terraform-awesome"
    }
  }
  spec {
    container {
      image = "nginx:latest"
      name  = "nginx"
      volume_mount {
        name       = "secret-volume"
        mount_path = "/data"
      }
    }
    volume {
      name = "secret-volume"
      secret {
        secret_name = "simple-k8s-secret"
      }
    }
  }
}

resource "kubernetes_secret" "simple-k8s-secret" {
  metadata {
    name      = "simple-k8s-secret"
    namespace = "default"
    labels = {
      "app.kubernetes.io/name"       = "simple-k8s-secret"
      "app.kubernetes.io/type"       = "secret"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }
  data = {
    mykey = "myvalue"
  }
}
