# Ansible Testnet

This repository contains playbooks for managing the Xian testnet.

## Setup

### Install ansible

see [ansible docs](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

### Install sshpass 
*This step is optional, less secure and purely for convenience of managing TESTNET important machines.*
*DO NOT USE FOR MANAGING MAINNET MACHINES*

see [sshpass github](https://gist.github.com/arunoda/7790979)

```bash
sudo apt-get update
sudo apt-get install -y sshpass
```

### Populate `inventory-devnet.ini` / `inventory-stagenet.ini`
- create `inventory-devnet.ini` / `inventory-stagenet.ini` in the root folder, populate it with the below format.
```
[validators] # These are validator nodes on your network.
<machine_hostname> ansible_host=<machine_ip> ansible_user=<user> ansible_ssh_pass="<machine_password>" sk="<machine_private_key>" vk="<machine_public_key>"
[service_nodes] # These are full nodes on your network
<machine_hostname> ansible_host=<machine_ip> ansible_user=<user> ansible_ssh_pass="<machine_password>" sk="<machine_private_key>" vk="<machine_public_key>"
```

## Playbooks

### Setup
*Installs all environment dependencies on validators and / or service_nodes*
- setup all machines :
  - `make setup NETWORK=<devnet|stagenet|othernet>`
- setup a specific group of machines :
  - `make setup TARGET=<hostname or group> NETWORK=<devnet|stagenet|othernet>` 

### Configure
*Prepares validators / service_nodes for running the blockchain.*
- configure all machines :
  - `make configure NETWORK=<devnet|stagenet|othernet>`
- configure a specific group of machines :
  - `make configure TARGET=<hostname or group> NETWORK=<devnet|stagenet|othernet>`

### Restart Nodes Processes
- all :
  - `make rs NETWORK=<devnet|stagenet|othernet>`
- some :
  - `make rs TARGET=<hostname or group> NETWORK=<devnet|stagenet|othernet>`

### Wipe all Validators + Restart "Down Wipe Up"
*Resets the node state / wipes all blocks & run data*
- all :
  - `make dwu NETWORK=<devnet|stagenet|othernet>`
- some :
  - `make dwu TARGET==<hostname or group> NETWORK=<devnet|stagenet|othernet>`
  
### Export ABCI state + Push to git
**this is currently broken**
*Creates a JSON with the state of the ABCI application, adds it to `genesis_testnet.json`, stages the change and pushes it to the testnet branch*
*Host machine must be signed into github, otherwise the push step will fail*
- Most likely to be called on a remote dev machine which has git access
- Add your remote machine to inventory.ini
  - `make gen2tn TARGET=<your_node_hostname> NETWORK=<devnet|stagenet|othernet>`
