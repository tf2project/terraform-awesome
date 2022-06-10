# https://github.com/ssbostan/terraform-awesome

# Generate a new RSA SSH key
resource "tls_private_key" "ssh" {
  algorithm = "RSA"
  rsa_bits  = "4096"
}