#!/bin/bash
need_packages=(git ruby curl)
: "setup require packages" && {
	manager_update() {
		type apt >/dev/null 2>&1 && sudo apt update
	}

	install_package() {
		local package_name=$1
		if type "$package_name" >/dev/null 2>&1; then 
			echo "$package_name is exist. skip =====>"
			return
		fi

		if type pacman >/dev/null 2>&1; then
			sudo pacman -Sy
			return
		fi
		if type brew >/dev/null 2>&1; then
			brew install $package_name
			return
		fi
		if type apt >/dev/null 2>&1; then
			sudo apt install -y $package_name
			return
		fi
		if type yum >/dev/null 2>&1; then
			sudo yum install -y $package_name
			return
		fi
	}

	echo "update package manager."
	manager_update
	for item in "${need_packages[@]}"
	do
		echo "install $item......"
		install_package $item
	done
}