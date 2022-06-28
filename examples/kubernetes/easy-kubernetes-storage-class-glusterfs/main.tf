# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_storage_class_v1" "glusterfs_storageclass" {
  metadata {
    name = "glusterfs"
    labels = {
      "app.kubernetes.io/name"       = "glusterfs"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }
  storage_provisioner = "kubernetes.io/glusterfs"
  reclaim_policy      = "Retain"
  parameters = {
    resturl         = "http://192.168.10.87:30280"
    clusterid       = "7948de654dac3eec5c513092b54ef629"
    restauthenabled = "true"
    restuser        = "admin"
    secretNamespace = "default"
    secretName      = "heketi-admin-secret"
    volumetype      = "none"
  }
}
