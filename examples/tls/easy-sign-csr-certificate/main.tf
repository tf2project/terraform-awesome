# https://github.com/ssbostan/terraform-awesome

resource "tls_locally_signed_cert" "task09" {
  cert_request_pem   = file("cert_request.pem")
  ca_private_key_pem = file("ca_private_key.pem")
  ca_cert_pem        = file("ca_cert.pem")

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
  ]
}
