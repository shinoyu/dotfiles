#!/bin/sh
set -e
set -u
c_dir=$(cd $(dirname $0); pwd)
ssh_dir=$HOME/.ssh

mkdir -p $ssh_dir
if [ ! -e $ssh_dir/config ]; then
    cp $c_dir/config $ssh_dir/config
fi