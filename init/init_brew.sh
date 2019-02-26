#!/bin/bash

if ! type "brew" >/dev/null 2>&1; then 
	if [ $(uname) != "Darwin" ] ; then
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	elif  [ $(uname) != "Linux" ] ; then
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
	fi
fi

