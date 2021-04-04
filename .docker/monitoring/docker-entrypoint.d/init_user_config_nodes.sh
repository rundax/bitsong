#!/usr/bin/env bash

set -e
set -u
set -o pipefail

cat > /src/config/user_config_nodes.ini <<EOF

[node_1]
node_name = ${NODE_GENERAL_NAME:=node_1}
node_is_validator = ${NODE_GENERAL_IS_VALIDATOR:=true}
node_rpc_url = ${NODE_GENERAL_RPC_URL:=http://11.22.33.11:26657}
include_in_node_monitor = ${NODE_GENERAL_INCLUDE_IN_NODE_MONITOR:=true}
include_in_network_monitor = ${NODE_GENERAL_INCLUDE_IN_NETWORK_MONITOR:=true}


[node_synced]
node_name = ${NODE_SLAVE_NAME:=node_1}
node_is_validator = ${NODE_SLAVE_IS_VALIDATOR:=false}
node_rpc_url = ${NODE_SLAVE_RPC_URL:=http://11.22.33.11:26657}
include_in_node_monitor = ${NODE_SLAVE_INCLUDE_IN_NODE_MONITOR:=true}
include_in_network_monitor = ${NODE_SLAVE_INCLUDE_IN_NETWORK_MONITOR:=true}



EOF