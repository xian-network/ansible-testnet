# Ansible Testnet

This repository contains playbooks and inventory definitions for managing the Xian testnet.

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
  
