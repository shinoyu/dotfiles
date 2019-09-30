#!/bin/sh
set -u

: "setup brew" && {
	if ! type brew >/dev/null 2>&1; then 
		if [ $(uname) != "Darwin" ] ; then
			/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
		elif  [ $(uname) != "Linux" ] ; then
			if type pacman >/dev/null 2>&1; then 
				echo "skip brew setting. use pacman environments"
			else
				sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
			fi
		fi
	fi
	
	if type brew >/dev/null 2>&1; then 
		brew bundle
	fi
}