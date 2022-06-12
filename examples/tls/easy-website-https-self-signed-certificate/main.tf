# https://github.com/ssbostan/terraform-awesome

resource "tls_private_key" "private_key" {
  algorithm = "RSA"
}

resource "tls_self_signed_cert" "cert" {
  private_key_pem       = tls_private_key.private_key.private_key_pem
  validity_period_hours = 8760
  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
  ]
  subject {
    common_name  = "www.terraformawesome.com"
  }
}

resource "local_file" "private_key" {
  filename        = "cert_key.pem"
  content         = tls_private_key.private_key.private_key_pem
  file_permission = "0600"
}

resource "local_file" "public_key" {
  filename = "cert_pub.pem"
  content  = tls_self_signed_cert.cert.cert_pem
}
