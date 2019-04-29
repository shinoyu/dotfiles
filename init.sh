#!/bin/sh
set -e

git clone https://github.com/shinoyu/dotfiles
cd dotfiles

: "set user role" && { 
	if [ ${EUID:-${UID}} != 0 ]; then
		sudo chown -R ${USER}:${USER} .
	fi
}

: "os_init" && {
	source ./init/init_darwin.sh
}
sh ./install.sh
