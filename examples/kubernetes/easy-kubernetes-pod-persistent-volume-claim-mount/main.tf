# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_deployment" "example" {
  metadata {
    name = "terraform-example"
    labels = {
      test = "MyExampleApp"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        test = "MyExampleApp"
      }
    }

    template {
      metadata {
        labels = {
          test = "MyExampleApp"
        }
      }

      spec {
        container {
          image = "nginx:1.21.6"
          name  = "example"

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
  }
}

resource "kubernetes_persistent_volume_claim" "terraform-example-claim" {
  metadata {
    name = "terraform-example-claim"
    labels = {
      test = "MyExampleApp"
    }

  }
  spec {
    storage_class_name = "glusterfs-example"
    access_modes       = ["ReadWriteMany"]
    resources {
      requests = {
        storage = "1Gi"
      }
    }
  }
}