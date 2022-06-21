# https://github.com/ssbostan/terraform-awesome
resource "kubernetes_pod_container_postart" "nginx" {
  metadata {
    name = "nginx"
    labels = {
      "app.kubernetes.io/name"       = "nginx"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }
  spec {
    selector = {
      "app.kubernetes.io/name"       = "nginx"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
    replicas = 1
    template {
      metadata {
        labels = {
          "app.kubernetes.io/name"       = "nginx"
          "app.kubernetes.io/created-by" = "terraform-awesome"
        }
      }
      spec {
        container {
          name  = "nginx"
          image = "nginx:latest"
          lifecycle:
            postStart:
              exec:
                command: ["/bin/sh", "-c", "echo Hello from the postStart handler > /usr/share/message"]
            preStop:
              exec:
                command: ["/bin/sh","-c","nginx -s quit; while killall -0 nginx; do sleep 1; done"]
        }
      }
    }
  }
}