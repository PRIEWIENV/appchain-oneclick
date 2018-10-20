#!/usr/bin/env bash

CITA="https://github.com/cryptape/cita/releases/download/v0.19/cita_secp256k1_sha3.tar.gz"

wget -P cita -c ${CITA} -t 8 -T 120

tar -zxvf cita/cita_secp256k1_sha3.tar.gz -C cita

rm cita/cita_secp256k1_sha3.tar.gz

if [[ `uname` == 'Darwin' ]]
then
    cp /etc/localtime $PWD/localtime
    LOCALTIME_PATH="$PWD/localtime"
else
    LOCALTIME_PATH="/etc/localtime"
fi

USER_ID=`id -u $USER`

echo > .env

echo "USER_ID=${USER_ID}" >> .env
echo "LOCALTIME_PATH=${LOCALTIME_PATH}" >> .env

cp re-birth/.env.local re-birth/re-birth/
