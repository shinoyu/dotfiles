#!/bin/sh
set -e

git clone https://github.com/shinoyu/dotfiles
cd dotfiles

if [ ${EUID:-${UID}} != 0 ]; then
	sudo chown -R ${USER}:${USER} .
fi

sh ./post_init

: "os_init" && {
	source ./init/init_darwin.sh
}

sh ./install.sh
