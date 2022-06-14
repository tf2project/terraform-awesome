# https://github.com/ssbostan/terraform-awesome

resource "tls_private_key" "private_key" {
  algorithm = "ED25519"
}

resource "local_file" "private_key" {
  filename        = "tls.key"
  content         = tls_private_key.private_key.private_key_pem
  file_permission = "0600"
}

resource "tls_cert_request" "tls_csr_request" {
  private_key_pem = tls_private_key.private_key.private_key_pem
  subject {
    common_name  = "example.com"
    organization = "terraform-awesome"
  }
}

resource "local_file" "tls_csr_request" {
  filename        = "tls.csr"
  content         = tls_cert_request.tls_csr_request.cert_request_pem
  file_permission = "0600"
}
