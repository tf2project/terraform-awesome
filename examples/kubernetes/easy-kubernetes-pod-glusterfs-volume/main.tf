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
          glusterfs {
            endpoints_name = "glusterfs-cluster"
            path           = "terraform-test"
            read_only      = false
          }
        }
      }
    }
  }
}
