#!/bin/bash
set -u

git clone https://github.com/shinoyu/dotfiles
cd dotfiles

: "set user role" && { 
	if [ ${EUID:-${UID}} != 0 ]; then
		sudo chown -R ${USER}:${USER} .
	fi
}

#sh ./install_mitamae.sh
sh ./env.sh
sh ./install.sh
