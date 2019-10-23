#!/bin/bash
set -u
c_dir=$(cd $(dirname $0); pwd)

if [ $(uname) == "Darwin" ] ; then
	sh $c_dir/init_darwin.sh
	# todo: mac only?
	export LC_ALL=ja_JP.UTF-8 
fi
