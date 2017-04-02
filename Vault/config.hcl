backend "file" {
  path = "/home/dominic/VaultServer/Vault/data"
}

listener "tcp" {
 address = "127.0.0.1:8201"
 tls_disable = 1
}

listener "tcp" {
 address = "0.0.0.0:8200"
 tls_cert_file = "/home/dominic/VaultServer/Vault/Secrets/vault.crt"
 tls_key_file = "/home/dominic/VaultServer/Vault/Secrets/vault.key"
}
