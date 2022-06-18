# https://github.com/ssbostan/terraform-awesome

resource "tls_private_key" "private_key" {
  algorithm = "ED25519"
}

resource "local_file" "private_key" {
  filename        = "ca_private_key.pem"
  content         = tls_private_key.private_key.private_key_pem
  file_permission = "0600"
}

resource "tls_self_signed_cert" "certificate" {
  private_key_pem       = tls_private_key.private_key.private_key_pem
  validity_period_hours = 12

  subject {
    common_name  = "example.com"
    organization = "terraform-awesome"
  }

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
  ]
}

resource "local_file" "certificate" {
  filename        = "ca_certificate.pem"
  content         = tls_self_signed_cert.certificate.cert_pem
  file_permission = "0600"
}

