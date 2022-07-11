# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_secret" "ceph_admin_secret" {
  metadata {
    name      = "ceph-admin-key"
    namespace = "default"
    labels = {
      "app.kubernetes.io/name"       = "ceph-rbd"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }
  type = "kubernetes.io/rbd"
  data = {
    key = "QVFDQ3E4cGljcmhrSkJBQW5VSWNKZHE3bzFaTENKbWZxS2cwTUE9PQ=="
  }
}

resource "kubernetes_secret" "ceph_user_secret" {
  metadata {
    name      = "ceph-user-key"
    namespace = "default"
    labels = {
      "app.kubernetes.io/name"       = "ceph-rbd"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }
  type = "kubernetes.io/rbd"
  data = {
    key = "QVFDQ3E4cGljcmhrSkJBQW5VSWNKZHE3bzFaTENKbWZxS2cwTUE9PQ=="
  }
}

resource "kubernetes_storage_class_v1" "ceph_rbd_storageclass" {
  metadata {
    name = "ceph-rbd-storage-class"
  }
  storage_provisioner = "kubernetes.io/rbd"
  reclaim_policy      = "Delete"
  parameters = {
    monitors             = "10.1.17.45:6789"
    adminId              = "admin"
    adminSecretName      = "ceph-admin-key"
    adminSecretNamespace = "default"
    pool                 = "replicapool"
    userId               = "admin"
    userSecretName       = "ceph-user-key"
    userSecretNamespace  = "default"
    fsType               = "ext4"
    imageFormat          = "2"
    imageFeatures        = "layering"
  }
}
