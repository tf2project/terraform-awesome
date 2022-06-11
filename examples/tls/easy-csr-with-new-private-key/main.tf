# https://github.com/ssbostan/terraform-awesome

resource "tls_private_key" "private_key" {
  algorithm = "ED25519"
}

resource "local_file" "private_key" {
  filename        = "private_key.pem"
  content         = tls_private_key.private_key.private_key_pem
  file_permission = "0600"
}

resource "tls_cert_request" "csr_file" {
  private_key_pem = local_file.private_key.content

  subject {
    common_name  = "example.com"
    organization = "terraform-awesome"
  }
}


resource "local_file" "csr_file" {
  filename        = "csr_file.txt"
  content         = tls_cert_request.csr_file.cert_request_pem
  file_permission = "0600"
}

