# https://github.com/ssbostan/terraform-awesome

resource "tls_private_key" "ed25519-example" {
  algorithm = "ED25519"
}

resource "tls_cert_request" "cert" {
  private_key_pem = tls_private_key.ed25519-example.private_key_pem
  dns_names       = ["cert.example.com"]
  ip_addresses    = ["127.0.0.1"]
  subject {
    common_name  = "cert.com"
    organization = "terraform awesome"
  }
}