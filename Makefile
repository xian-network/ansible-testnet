TARGET ?= all
LOGS_LINES ?= 100
EXPORT_STATE_HOST ?= dev_node
NETWORK ?= stagenet

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
make rs:
	ansible-playbook ./playbooks/nodes_restart.yml -i inventory_$(NETWORK).ini -l $(TARGET)

# start / restart all validators
make rs-v:
	make rs TARGET=validators

# start / restart all service nodes
make rs-sn:
	make rs TARGET=service_nodes

# WARNING : this will wipe all blockchain state
# down wipe up all node + service node processes -
make dwu:
	ansible-playbook ./playbooks/nodes_wipe_restart.yml -i inventory_$(NETWORK).ini -l $(TARGET)

make logs:
	ansible-playbook ./playbooks/logs.yml -i inventory_$(NETWORK).ini -l $(TARGET) -e "lines=$(LOGS_LINES)"
	
make gen2tn:
	ansible-playbook ./playbooks/gen2tn.yml -i inventory_$(NETWORK).ini -l $(EXPORT_STATE_HOST)

make setup_prometheus:
	ansible-playbook ./playbooks/setup_prometheus.yml -i inventory_$(NETWORK).ini

make down:
	ansible-playbook ./playbooks/nodes_down.yml -i inventory_$(NETWORK).ini -l $(TARGET)

make up:
	ansible-playbook ./playbooks/nodes_up.yml -i inventory_$(NETWORK).ini -l $(TARGET)

make wipe:
	ansible-playbook ./playbooks/nodes_wipe.yml -i inventory_$(NETWORK).ini -l $(TARGET)