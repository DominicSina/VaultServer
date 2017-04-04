# VaultServer

Deployment:
Make sure Ansible is installed ont the deploying machine. 
Clone this repo and locate its Ansible directory. 
Make sure the hosts file contains your desired hosts.
In the Ansible directory execute:

ansible-playbook -i hosts deployVaults.yaml -K

to deploy the vault. Enter your user password for the target 
machines. To create a basic user first unseal your vault and
then run: 

ansible-playbook -i hosts createBasicUser.yaml --extra-vars "root_token=[root_token_received_during_vault_init]"

