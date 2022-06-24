# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_pod" "pod_container_commands" {
  metadata {
    name      = "pod-container-commands"
    namespace = "default"
    labels = {
      "app.kubernetes.io/name"       = "pod-container-commands"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }
  spec {
    container {
      name    = "pod-container-commands"
      image   = "nginx:latest"
      command = ["nginx"]
      args    = ["-g", "daemon off;"]
    }
  }
}

