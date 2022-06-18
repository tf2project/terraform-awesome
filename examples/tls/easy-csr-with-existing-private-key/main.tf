# https://github.com/ssbostan/terraform-awesome

data "local_file" "private_key" {
  filename = "${path.module}/tls.key"
}

resource "tls_cert_request" "tls_csr_request" {
  private_key_pem = data.local_file.private_key.content
  subject {
    organization = "terraform-awesome"
  }
}

resource "local_file" "tls_csr_request" {
  filename        = "tls.csr"
  content         = tls_cert_request.tls_csr_request.cert_request_pem
  file_permission = "0600"
}