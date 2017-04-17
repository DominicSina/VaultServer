# VaultServer

## Deployment and setup

Deploy/update to dev server(s):
Make sure Ansible is installed on the deploying machine. 
Clone this repo and change to its Ansible directory. 
Make sure the hosts file contains your desired dev server.
In deploy_vault_dev_server.yaml change remote_user if necessary.
To deploy the vault execute:
ansible-playbook -i hosts deploy_vault_dev_server.yaml -K

Enter the password for your remote user when prompted

To check if the ansible server works you can check it's status with:
```curl -k https://192.168.2.1:8200/v1/sys/init```

To create a basic user first unseal your vault with the received key shards
and then run:
```ansible-playbook -i hosts create_basic_vault_user.yaml --extra-vars "root_token=[root_token_received_during_initialization]" -K```

## Accessing the server

### Authentication
To authenticate as user "user" run, this works for userpass authentication:
```curl -k -d '{"password":"pw"}' https://192.168.2.1:8200/v1/auth/userpass/login/user```

### Storing and reading certificates
To store the crt of a certain server use the received client_token:
```
curl -k -H "X-Vault-Token: [client_token]" -d '{"value":"crtstring"}' https://192.168.2.1:8200/v1/secret/certs/[crt_owner]/crt
curl -k -H "X-Vault-Token: d2637c88-ac16-db2d-3ec8-d1f49af63049" -d '{"value":"crtstring"}' https://192.168.2.1:8200/v1/secret/certs/192.168.1.1/crt
```

To read something use:
```curl -k -H "X-Vault-Token: [client_token]" https://192.168.2.1:8200/v1/secret/certs/[crt_owner]/crt```

Can be used to store a json file with the crt contained in it.
```curl -k -H "X-Vault-Token: [client_token]" -d @/home/dominicsina/Desktop/crt.json https://192.168.2.1:8200/v1/secret/certs/192.168.1.1/crt```

To store the content of a crt file use something like this:
```
curl -k -X POST https://192.168.2.1:8200/v1/secret/certs/[crt_owner]/crt \
-H "Content-Type: application/json" \
-H "X-Vault-Token: [client_token]" \
-d @- << EOF
{
    "value": "$(cat /opt/VaultServer/Vault/Secrets/vault.crt)"
}
EOF
```





