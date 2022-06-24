# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_pod" "pod_direct_env" {
  metadata {
    name      = "pod-direct-env"
    namespace = "default"
    labels = {
      "app.kubernetes.io/name"       = "pod-direct-env"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }

  spec {
    container {
      name    = "pod-direct-env"
      image   = "k8s.gcr.io/busybox"
      command = ["sh", "-c"]
      args    = ["echo $MY_NODE_NAME $MY_POD_NAME $MY_POD_IP"]
      env {
        name  = "MY_NODE_NAME"
        value = "node-direct-env"
      }
      env {
        name  = "MY_POD_NAME"
        value = "pod-direct-env"
      }
    }
  }
}

