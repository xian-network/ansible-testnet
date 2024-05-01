# Ansible Testnet

This repository contains playbooks for managing the Xian testnet.

## Setup

### Install ansible

see [ansible docs](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

### Install sshpass 

see [sshpass github](https://gist.github.com/arunoda/7790979)

```bash
sudo apt-get update
sudo apt-get install -y sshpass
```

## Playbooks

### Setup
*Installs all environment dependencies on validators and / or service_nodes*
- setup all machines :
  - `make setup`
- setup a specific group of machines :
  - `make setup TARGET=<hostname or group>`

### Configure
*Prepares validators / service_nodes for running the blockchain.*
- configure all machines :
  - `make configure`
- configure a specific group of machines :
  - `make configure TARGET=<hostname or group>`

### Restart Nodes Processes
- all :
  - `make rs`
- some :
  - `make rs TARGET=<hostname or group>`

### Wipe all Validators + Restart
*Resets the node state / wipes all blocks & run data*
- all :
  - `make rs`
- some :
  - `make rs TARGET==<hostname or group>`
  
### Export ABCI state + Push to git
*Creates a JSON with the state of the ABCI application, adds it to `genesis_testnet.json`, stages the change and pushes it to the testnet branch*
*Host machine must be signed into github, otherwise the push step will fail*
- Most likely to be called on a remote dev machine which has git access
- Add your remote machine to inventory.ini
  - `make gen2tn TARGET=<your_node_hostname>`
