storage "file" {
  path = "/home/dominic/VaultServer/Vault/data"
}

listener "tcp" {
 address = "0.0.0.0:8200"
 tls_disable = 1
}
