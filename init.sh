#!/bin/sh
set -e

git clone https://github.com/shinoyu/dotfiles
cd dotfiles

: "set user role" && { 
	if [ ${EUID:-${UID}} != 0 ]; then
		sudo chown -R ${USER}:${USER} .
	fi
}
sh ./post_init

: "os_init" && {
	source ./init/init_darwin.sh
	source ./init/init_brew.sh
}
sh ./install.sh
