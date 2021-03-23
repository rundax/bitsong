#!/usr/bin/env bash

set -e
set -u
set -o pipefail


if [ ! -d /home/bitsong/.bitsongd/config  ]; then
    bitsongd init --chain-id ${BITSONG_INIT_CHAIN_ID} ${BITSONG_INIT_MONIKER}
#    bitsongcli keys add --chain-id ${BITSONG_INIT_CHAIN_ID} ${BITSONG_INIT_WALLET_NAME}
    wget --force-directories https://raw.githubusercontent.com/bitsongofficial/networks/master/${BITSONG_INIT_CHAIN_ID}/genesis.json -o /home/bitsong/.bitsongd/config/genesis.json
fi