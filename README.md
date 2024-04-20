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


## Use-cases

- [x] Setup & Configure Nodes
- [ ] Nodes up
- [ ] Nodes down

## TO-DO

- [x] Dynamic passing of private key to playbooks
- [x] Transition Playbooks to use Makefile & PM2 instead of systemCTL
- [x] Assess Current State of the setup_xian playbook
- [x] config.toml
  - [x] Setup Seeds
- [x] Create Validator codes correctly
- [x] Confirm the branch is being built correctly
- [x] Verify Makefile commands still work
  - [x] up
  - [x] down
  - [x] wipe
- [x] Submit transaction to node => success ?