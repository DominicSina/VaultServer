path "secret/*" {
  policy = "read"
  capabilities = ["create", "update", "delete"]
}
