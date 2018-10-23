#!/bin/bash

# default accounts
ADDRS=(\
    "0xc5CBC9692F903f5bA6fE3e9D8bb125cF2a86F0a9" \
    "0x381310CFD8160Bcf4A868f776BC6f975812bf2fC" \
    "0x1af051BaCb0342f38DB68056f753686f5C822984" \
    "0xDfA9118aeee9d5D3b7B0aD0F3A0Ff396CB7040Df"\
)

WORK_PATH=$(dirname $(readlink -f $0))
HAS_CHAIN=false

if [ -d "test-chain" ];then
    HAS_CHAIN=true
fi

# Create 4 consensus nodes
if [ "$HAS_CHAIN" = false ];then
    ./scripts/create_cita_config.py create \
    --chain_name test-chain \
    --jsonrpc_port 1337 \
    --ws_port 4337 \
    --grpc_port 5000 \
    --nodes "127.0.0.1:4000,127.0.0.1:4001,127.0.0.1:4002,127.0.0.1:4003" \
    --contract_arguments "SysConfig.chainId=1" "SysConfig.economicalModel=1"
fi

# Setup the nodes
for i in {0..3};do
    ./bin/cita setup test-chain/$i
done
echo "Successfully setup test-chain!"

# Start the nodes
for i in {0..3};do
    echo "Node $i starting..."
    ./bin/cita start test-chain/$i
done
echo "Test chain started successfully!"

# Send txs to transfer initial value to default accounts
if [ "$HAS_CHAIN" = false ];then
    RAW_TXS=(`cat ${WORK_PATH}'/raw_txs'`)
    for item in ${RAW_TXS[@]};do
        curl -sX POST --data '{"jsonrpc":"2.0","method":"sendRawTransaction","params":["'${item}'"],"id":74}' 127.0.0.1:1337
    done
fi

# Keep the docker running
while true;do
    sleep 100;
done
