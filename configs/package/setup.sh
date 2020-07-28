#!/bin/bash
set -u

need_packages=(git curl golang)
: "setup require packages" && {
	echo "update package manager."
	manager_update()
	for item in "${need_packages[@]}"
	do
		echo "install $item......"
		install_package $item
	done
}