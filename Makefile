TARGET ?= all
LOGS_LINES ?= 100

# To perform an action on a specific node, use the TARGET variable from the cli
# eg: `make setup TARGET=validators` or `make rs TARGET=service_nodes`

setup:
	ansible-playbook setup_xian.yml -i inventory.ini -l $(TARGET)

# start / restart all node + service node processes
make rs:
	ansible-playbook nodes_restart.yml -i inventory.ini -l $(TARGET)

# start / restart all validators
make rs-v:
	make rs TARGET=validators

# start / restart all service nodes
make rs-sn:
	make rs TARGET=service_nodes

# WARNING : this will wipe all blockchain state
# down wipe up all node + service node processes -
make dwu:
	ansible-playbook deploy_web_ui.yml -i inventory.ini -l $(TARGET)

make logs:
	ansible-playbook logs.yml -i inventory.ini -l $(TARGET) -e "lines=$(LOGS_LINES)"
	