#!/bin/bash
set -u

# setup provisining tools.
version='1.5.6'
target="mitamae-${version}"

if ! [ -f "tool/bin/${target}" ]; then 

	case "$(uname)" in
		"Darwin")
			target_bin="mitamae-x86_64-darwin"
			;;
		"Linux")
			target_bin="mitamae-x86_64-linux"
			;;
		*)
			echo "do not support. $(uname)"
			exit1
			;;
	esac

# echo "https://github.com/itamae-kitchen/mitamae/releases/download/v${version}/${target_bin}.tar.gz"

	curl -fL "https://github.com/itamae-kitchen/mitamae/releases/download/v${version}/${target_bin}.tar.gz" -o "${target_bin}.tar.gz"

	tar xvzf "${target_bin}.tar.gz"
	mv "${target_bin}" "tool/bin/${target}"
	chmod +x "tool/bin/${target}"
	rm "${target_bin}.tar.gz"
fi

ln -sf "${target}" "tool/bin/mitamae"
