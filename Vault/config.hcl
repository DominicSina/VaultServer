backend "file" {
  path = "/opt/VaultServer/Vault/data"
}

listener "tcp" {
 address = "127.0.0.1:8200"
 tls_disable = 1
}

listener "tcp" {
 address = "192.168.2.1:8200"
 tls_cert_file = "/opt/VaultServer/Vault/Secrets/vault.crt"
 tls_key_file = "/opt/VaultServer/Vault/Secrets/vault.key"
}
