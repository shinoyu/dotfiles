#!/bin/bash

L_UID=${LOCAL_UID:-9001}
L_GID=${LOCAL_GID:-9001}

echo "RUN UID : $L_UID, GID: $L_GID"
useradd -u $L_UID -o -m user
groupadd -g $L_GID user
export HOME=/home/user

bash