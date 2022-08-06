https://github.com/tf2project/terraform-awesome

resource "kubenetes_persistent_volume_v1" "iscsi_volume" {
    metadata {
        name = "iscsi-volume"
    }

    iscsi {
        fs_type = "ext4"
        iqn = "iqn.2017-10.local.example.server:disk1"
        read_only = false
        target_portal = 192.168.1.1
    }

    spec {
        capacity = {
            storage = "2Gi"
        }

        access_modes = ["ReasWriteMnay"]

    }
}