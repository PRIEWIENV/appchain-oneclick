#!/usr/bin/env bash

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
