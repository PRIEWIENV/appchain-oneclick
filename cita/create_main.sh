#!/bin/bash

ADDR_0="0xc5CBC9692F903f5bA6fE3e9D8bb125cF2a86F0a9"
ADDR_1="0x381310CFD8160Bcf4A868f776BC6f975812bf2fC"
ADDR_2="0x1af051BaCb0342f38DB68056f753686f5C822984"
ADDR_3="0xDfA9118aeee9d5D3b7B0aD0F3A0Ff396CB7040Df"

PRIV_0="0xaeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee0"
PRIV_1="0xaeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee1"
PRIV_2="0xaeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee2"
PRIV_3="0xaeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee3"


if [ ! -d "test-chain" ]; then
    ./scripts/create_cita_config.py create \
    --chain_name test-chain \
    --jsonrpc_port 1337 \
    --ws_port 4337 \
    --grpc_port 5000 \
    --nodes "127.0.0.1:4000,127.0.0.1:4001,127.0.0.1:4002,127.0.0.1:4003" \
    --authorities "$ADDR_0,$ADDR_1,$ADDR_2,$ADDR_3" \
    --contract_arguments "SysConfig.chainId=1" "SysConfig.economicalModel=1"
fi

for i in {0..3}
do
    eval echo '$PRIV_'"$i" > test-chain/$i/privkey
    ./bin/cita setup test-chain/$i
done

echo "Successfully setup test-chain!"

for i in {0..3}
do
    ./bin/cita start test-chain/$i
    echo "Node $i started!"
done

echo "Test chain started!"

while true
do
    sleep 100;
done
