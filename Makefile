TARGET ?= all
LOGS_LINES ?= 100
EXPORT_STATE_HOST ?= dev_node
NETWORK ?= devnet

# To perform an action on a specific node, use the TARGET variable from the cli
# eg: `make setup TARGET=validators` or `make rs TARGET=service_nodes`

# Pulls the latest changes for contracting / xian
# Installs both packages
# Populates the validator private key based on sk passed from ansible
configure:
	ansible-playbook ./playbooks/configure.yml -i inventory_$(NETWORK).ini -l $(TARGET)

setup:
	ansible-playbook ./playbooks/setup_env.yml -i inventory_$(NETWORK).ini -l $(TARGET)

# start / restart all node + service node processes
rs:
	ansible-playbook ./playbooks/nodes_restart.yml -i inventory_$(NETWORK).ini -l $(TARGET)

# start / restart all validators
rs-v:
	make rs TARGET=validators

# start / restart all service nodes
rs-sn:
	make rs TARGET=service_nodes

# WARNING : this will wipe all blockchain state
# down wipe up all node + service node processes -
dwu:
	ansible-playbook ./playbooks/nodes_wipe_restart.yml -i inventory_$(NETWORK).ini -l $(TARGET)

logs:
	ansible-playbook ./playbooks/logs.yml -i inventory_$(NETWORK).ini -l $(TARGET) -e "lines=$(LOGS_LINES)"
	
gen2tn:
	ansible-playbook ./playbooks/gen2tn.yml -i inventory_$(NETWORK).ini -l $(EXPORT_STATE_HOST)

setup_prometheus:
	ansible-playbook ./playbooks/setup_prometheus.yml -i inventory_$(NETWORK).ini

down:
	ansible-playbook ./playbooks/nodes_down.yml -i inventory_$(NETWORK).ini -l $(TARGET)

up:
	ansible-playbook ./playbooks/nodes_up.yml -i inventory_$(NETWORK).ini -l $(TARGET)

wipe:
	ansible-playbook ./playbooks/nodes_wipe.yml -i inventory_$(NETWORK).ini -l $(TARGET)

configure-firewall:
	ansible-playbook ./playbooks/configure_firewall.yml -i inventory_$(NETWORK).ini

# update-wipe-restart
uws:
	make configure
	make dwu