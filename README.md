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

### Setup Nodes
- Sets up the xian-core node software on each node listed in `inventory.ini`
- When asked for the vault pass, enter the password contained in Notion @ https://www.notion.so/Testnet-Ansible-Inventory-a09a2356f6b542e4b8bc7a45c3151741?pvs=4
- `ansible-playbook setup_xian.yml -i inventory.ini


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