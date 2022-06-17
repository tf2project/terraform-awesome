# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_config_map" "sample_config" {
  metadata {
    name = "sampleconf"
  }
  data = {
    api_host = "myhost:443"
    db_host  = "dbhost:5432"
  }
}