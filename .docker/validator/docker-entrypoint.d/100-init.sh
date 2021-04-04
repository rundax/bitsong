#!/usr/bin/env bash

set -e
set -u
set -o pipefail


if [ ! -d /home/bitsong/.bitsongd/config  ]; then
    mkdir -p /home/bitsong/.bitsongd/config/
    bitsongd init --chain-id ${BITSONG_INIT_CHAIN_ID} ${BITSONG_INIT_MONIKER}
#    bitsongcli keys add --chain-id ${BITSONG_INIT_CHAIN_ID} ${BITSONG_INIT_WALLET_NAME}
fi


if [ ! -f /home/bitsong/.bitsongd/config/genesis.json  ]; then
    echo "Install genesis"
    wget https://raw.githubusercontent.com/bitsongofficial/networks/master/${BITSONG_INIT_CHAIN_ID}/genesis.json -O /home/bitsong/.bitsongd/config/genesis.json
fi

