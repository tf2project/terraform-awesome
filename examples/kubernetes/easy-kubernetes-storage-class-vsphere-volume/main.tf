# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_storage_class_v1" "vsphere_volume_storageclass" {
  metadata {
    name = "vsphere"
    labels = {
      "app.kubernetes.io/name"       = "vsphere_volume"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }
  storage_provisioner = "kubernetes.io/vsphere_volume"
  reclaim_policy      = "Retain"
  parameters = {
    datastore: "VSANDatastore"
    diskformat: "thin"
    fstype: "ext4"
  }
}
