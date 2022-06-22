# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_pod" "nginx-persistent-volume-claim" {
  metadata {
    name      = "nginx-persistent-volume-claim"
    namespace = "default"
    labels = {
      "app.kubernetes.io/name"       = "nginx-persistent-volume-claim"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }
  spec {
    container {
      image = "nginx:1.21.6"
      name  = "nginx-persistent-volume-claim"

      volume_mount {
        name       = "terraform-example"
        mount_path = "/var/nginx"
        read_only  = false
      }
    }

    volume {
      name = "terraform-example"
      persistent_volume_claim {
        claim_name = "terraform-example-claim"
      }
    }
  }
}

resource "kubernetes_persistent_volume_claim" "terraform_example_claim" {
  metadata {
    name = "terraform-example-claim"
    labels = {
      "app.kubernetes.io/name"       = "nginx-persistent-volume-claim"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }

  }
  spec {
    storage_class_name = "glusterfs"
    access_modes       = ["ReadWriteMany"]
    resources {
      requests = {
        storage = "1Gi"
      }
    }
  }
}
