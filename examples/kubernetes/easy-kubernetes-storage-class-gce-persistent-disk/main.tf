# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_storage_class" "example_gce_pd" {
  metadata {
    name = "terraform-example"
    labels = {
      "app.kubernetes.io/name"       = "example_gce_pd"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }
  storage_provisioner = "kubernetes.io/gce-pd"
  parameters = {
    type             = "pd-standard"
    fstype           = "ext4"
    replication_type = "none"
  }
}
