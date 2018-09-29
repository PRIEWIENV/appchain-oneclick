#!/bin/bash

if [ ! -d "test-chain" ]; then
    ./scripts/create_cita_config.py create \
    --chain_name test-chain \
    --jsonrpc_port 1337 \
    --ws_port 4337 \
    --grpc_port 5000 \
    --nodes "127.0.0.1:4000,127.0.0.1:4001,127.0.0.1:4002,127.0.0.1:4003" \
    --contract_arguments "SysConfig.chainId=1" "SysConfig.economicalModel=1"
fi

for i in {0..3}
do
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
