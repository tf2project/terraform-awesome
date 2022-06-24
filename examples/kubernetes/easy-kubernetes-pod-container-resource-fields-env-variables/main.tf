# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_pod" "pod_resource_env" {
  metadata {
    name      = "pod-resource-env"
    namespace = "default"
    labels = {
      "app.kubernetes.io/name"       = "pod-resource-env"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }

  spec {
    container {
      name    = "pod-resource-env"
      image   = "k8s.gcr.io/busybox"
      command = ["sh", "-c"]
      args    = ["echo $MY_NODE_NAME $MY_POD_NAME $MY_POD_IP"]
      env {
        name = "MY_NODE_NAME"
        value_from {
          field_ref {
            field_path = "spec.nodeName"
          }
        }
      }
      env {
        name = "MY_POD_NAME"
        value_from {
          field_ref {
            field_path = "metadata.name"
          }
        }
      }
      env {
        name = "MY_POD_IP"
        value_from {
          field_ref {
            field_path = "status.podIP"
          }
        }
      }
    }
  }
}

