# https://github.com/ssbostan/terraform-awesome


resource "tls_private_key" "ed25519_key" {
  algorithm = "ED25519"
}

resource "local_file" "private_key" {
  filename = "id_ed25519"
  content  = tls_private_key.ed25519_key.private_key_openssh
}
