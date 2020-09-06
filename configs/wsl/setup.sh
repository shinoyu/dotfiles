#!/bin/bash
set -e

current=$(cd $(dirname $0); pwd)
echo "need sudo operation. "
read tmp
sudo cp $current/wsl.conf /etc/wsl.conf