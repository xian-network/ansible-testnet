# Ansible Testnet

This repository contains playbooks and inventory definitions for managing the Xian testnet.

## Setup

### Install ansible

### Install sshpass 

```bash
sudo apt-get update
sudo apt-get install -y sshpass
```

## Playbooks

### Setup & Configure nodes
*Installs all dependencies, updates repositories and configures nodes*
- `ansible-playbook setup_xian.yml -i inventory.ini

### Restart Validator Processes
- `ansible-playbook nodes_restart.yml -i inventory.ini

### Wipe all Validators + Restart
- `ansible-playbook nodes_restart.yml -i inventory.ini