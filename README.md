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

ansible-playbook -i hosts createBasicUser.yaml --extra-vars "root_token=[root_token_received_during_vault_deployment]"

