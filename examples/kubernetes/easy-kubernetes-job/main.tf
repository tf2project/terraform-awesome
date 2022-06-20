# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_job" "demo-job" {
  metadata {
    name = "demo-job"
    labels = {
      "app.kubernetes.io/name"       = "demo-job"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }
  spec {
    template {
      metadata {}
      spec {
        container {
          name    = "pi"
          image   = "perl"
          command = ["perl", "-Mbignum=bpi", "-wle", "print bpi(2000)"]
        }
        restart_policy = "Never"
      }
    }
    backoff_limit = 4
  }
  wait_for_completion = false
}
