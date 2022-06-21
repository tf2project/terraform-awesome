# https://github.com/ssbostan/terraform-awesome

resource "tls_private_key" "example_rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
  provisioner "local-exec" {    # Generate "terraform-key-pair.pem" in current directory
    command = <<-EOT
      echo '${tls_private_key.example_rsa.private_key_pem}' > ./myKey.pem
      chmod 400 ./myKey.pem
    EOT
  }
}


