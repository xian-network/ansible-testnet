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
- When asked for the vault pass, enter the password contained in Notion - 
- `ansible-playbook setup_xian.yml --ask-vault-pass`


## Use-cases

- [x] Create seed node
- [ ] Create non-seed nodes

## TO-DO

- [ ] Dynamic passing of private key to playbooks
- [ ] Add more use-cases