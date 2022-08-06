https://github.com/tf2project/terraform-awesome

resource "kubernetes_persistent_volume" "aws-ebs" {
  metadata {
    name = "aws-ebs"
  }

  spec {
    storage_class_name               = "ebs-class"
    persistent_volume_reclaim_policy = "Retain"
    capacity = {
      storage = "2Gi"
    }

    access_modes = ["ReadWriteMany"]  

    persistent_volume_source {
      csi {
        driver        = "ebs.csi.aws.com"
        volume_handle = "awsElasticBlockStore"
      }
    }
  }
}