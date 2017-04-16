# VaultServer

Deploy/update to dev server(s):
Make sure Ansible is installed on the deploying machine. 
Clone this repo and change to its Ansible directory. 
Make sure the hosts file contains your desired dev server.
In deploy_vault_dev_server.yaml change remote_user if necessary.
To deploy the vault execute:
ansible-playbook -i hosts deploy_vault_dev_server.yaml -K

Enter the password for your remote user when prompted

To create a basic user first unseal your vault and
then run: 
ansible-playbook -i hosts create_basic_vault_user.yaml --extra-vars "root_token=[root_token_received_during_initialization]" -K

To check if the ansible server works you can check it's status with:
curl -k https://192.168.2.1:8200/v1/sys/init

To authenticate as user "user" run:
curl -k -d '{"password":"pw"}' https://192.168.2.1:8200/v1/auth/userpass/login/user


