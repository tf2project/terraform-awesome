# https://github.com/ssbostan/terraform-awesome

resource "tls_locally_signed_cert" "sign_csr_request" {
  cert_request_pem      = file("cert_request.pem")
  ca_private_key_pem    = file("ca_private_key.pem")
  ca_cert_pem           = file("ca_cert.pem")
  validity_period_hours = 8760
  allowed_uses = [
    "any_extended",
    "key_encipherment",
    "digital_signature",
    "server_auth"
  ]
}
