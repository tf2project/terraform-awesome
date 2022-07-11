# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_secret" "ceph_rbd_secret" {
  metadata {
    name      = "ceph-rbd-key"
    namespace = "default"
    labels = {
      "app.kubernetes.io/name"       = "ceph-rbd"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }
  data = {
    key = "dewfcbyfg3627c8gfeuidbnwjs3e2r=="
  }
}

resource "kubernetes_persistent_volume" "ceph_rbd" {
  metadata {
    name      = "ceph-rbd"
    namespace = "default"
    labels = {
      "app.kubernetes.io/name"       = "ceph-rbd"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }

  spec {
    capacity = {
      storage = "1Gi"
    }
    access_modes       = ["ReadWriteOnce"]
    volume_mode        = "Block"
    storage_class_name = "manual"
    persistent_volume_source {
      rbd {
        ceph_monitors = ["rook-ceph-mon-a:6789", "rook-ceph-mon-b:6789", "rook-ceph-mon-c:6789"]
        fs_type       = "ext4"
        rados_user    = "admin"
        rbd_image     = "ceph-rbd"
        rbd_pool      = "replicapool"
        read_only     = "false"
        secret_ref {
          name      = "ceph-rbd-key"
          namespace = "default"
        }
      }
    }
  }
}
