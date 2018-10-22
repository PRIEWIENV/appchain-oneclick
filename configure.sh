#!/usr/bin/env bash

CITA="cita_secp256k1_sha3"
CITA_TAR="$CITA.tar.gz"
CITA_URL="https://github.com/cryptape/cita/releases/download/v0.19/$CITA_TAR"

cd cita
if [ ! -d $CITA ]; then
    if [ ! -f $CITA_TAR ]; then
        curl -fLO $CITA_URL --retry 8
    fi
    shasum -a 1 -c cita-sha1 | grep -q "OK$"
    if [ $? -ne 0 ]; then
        echo "$CITA SHA-1 failed!"
        exit
    else
        tar -zxvf $CITA_TAR
        rm $CITA_TAR
    fi
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

cp re-birth/.env.local re-birth/re-birth/
