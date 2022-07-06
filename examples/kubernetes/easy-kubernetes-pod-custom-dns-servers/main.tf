# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_pod" "nginx" {
  metadata {
    name      = "nginx"
    namespace = "default"
    labels = {
      "app.kubernetes.io/name"       = "nginx"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }
  spec {
    container {
      name  = "nginx"
      image = "nginx:latest"
      port {
        name           = "http"
        protocol       = "TCP"
        container_port = 80
      }


      dns_config {
        nameservers = ["4.2.2.4", "8.8.8.8", "4.2.2.1"]
        searches    = ["example.com"]

        option {
          name  = "terraform-awesome.com"
          value = "1.1.1.1"
        }
        option {
          name = "terraform-awesome.com"
        }

      }

    }

  }

}



