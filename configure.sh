#!/usr/bin/env bash

CITA_URL="https://github.com/cryptape/cita/releases/download/v0.19/cita_secp256k1_sha3.tar.gz"
CITA="cita_secp256k1_sha3.tar.gz"


cd cita
if [ ! -f $CITA ]; then
    curl -fLO ${CITA_URL} --retry 8
fi
sha1sum -c cita-sha1 | grep -q "OK$"
if [ $? -ne 0 ]; then
    echo "$CITA SHA-1 failed!"
    exit
else
    rm -rf cita_secp256k1_sha3
    tar -zxvf $CITA
    rm $CITA
fi
cd -

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

cp microscope/.env microscope/microscope/
