# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_storage_class_v1" "local_storageclass" {
  metadata {
    name = "local"
    labels = {
      "app.kubernetes.io/name"       = "local"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }
  storage_provisioner = "kubernetes.io/no-provisioner"
  reclaim_policy      = "Delete"
  volume_binding_mode = "WaitForFirstConsumer"
}
