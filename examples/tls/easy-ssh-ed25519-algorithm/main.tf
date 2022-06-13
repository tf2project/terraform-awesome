# https://github.com/ssbostan/terraform-awesome

resource "tls_private_key" "ssh_key_pair" {
  algorithm = "ED25519"
}

resource "local_file" "ssh_private_key" {
  filename        = "id_ed25519"
  content         = tls_private_key.ssh_key_pair.private_key_openssh
  file_permission = "0600"
}

resource "local_file" "ssh_public_key" {
  filename        = "id_ed25519.pub"
  content         = tls_private_key.ssh_key_pair.public_key_openssh
  file_permission = "0600"
}
