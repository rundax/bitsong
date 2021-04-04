####variables####
denom=ubtsg
validator=bitsongvaloper1wtf99e8l5k2yxxc0rj6xwxj7mfam9hfnjqznja
delegator=bitsong1wtf99e8l5k2yxxc0rj6xwxj7mfam9hfnny76zq
wallet_name=kys
wallet_password=qwerty
chain_id=bitsong-testnet-5
sleep_time=10

while true
do
  echo $wallet_password | bitsongcli tx distribution withdraw-rewards --commission $validator --from $wallet_name --chain-id $chain_id --yes
  value=$(bitsongcli query account $(bitsongcli keys show $wallet_name -a) --chain-id $chain_id -o json | jq -r '.value.coins | .[].amount')
  echo "Balance to delegate is $value ubtsg"
  echo "Bitsong staking tx" | bitsongcli tx staking delegate $validator ${value}ubtsg --from $wallet_name --chain-id $chain_id --yes
  echo "sleep for $sleep_time"
  sleep $sleep_time
done