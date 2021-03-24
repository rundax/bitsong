# Run Bitsong node in Docker container

## _Make sure you have installed Docker and Docker-compose. Use official manuals for this_ 

## Installation

1. Clone repository and go to the root folder

2. Copy .env.dist and set up needed configuarion

```sh
cp .env.dist .env
```

2. Change .env file with needed variables. 

**For production setup leave only variables presented bellow**

```sh
DC_MAP_UID=1000
BITSONG_TAG=0.7.0-rc1
BITSONG_INIT_CHAIN_ID=<BITSONG CHAIN ID>
BITSONG_INIT_MONIKER=<YOUR MONIKER NAME>
```

3. Create container

```sh
make build
```

4. Start container

```sh
make up
```

5. Recover bitsongcli wallet

```sh
docker-compose run app bash
bitsongcli keys add <your-wallet-name> --recover
```

Paste your mnemonic phrase

> Enter your bip39 mnemonic

6. Create genesis transaction according to the instructions from official [Bitsong repository](https://github.com/bitsongofficial)
