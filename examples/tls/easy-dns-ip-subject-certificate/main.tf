# https://github.com/ssbostan/terraform-awesome

resource "tls_private_key" "cert" {
  algorithm = "ED25519"
}

resource "tls_cert_request" "cert" {
  private_key_pem = tls_private_key.cert.private_key_pem
  dns_names       = ["localhost"]
  ip_addresses    = ["127.0.0.1"]
  subject {
    common_name  = "localhost"
    organization = "terraform awesome"
  }
}

resource "local_file" "tls_key" {
  filename = "tls.key"
  content  = tls_private_key.cert.private_key_pem
}

resource "local_file" "tls_cert" {
  filename = "tls.crt"
  content  = tls_cert_request.cert.cert_request_pem
}