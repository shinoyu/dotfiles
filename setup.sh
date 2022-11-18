#!/bin/bash
set -u
c_dir=$(cd $(dirname $0); pwd)
configs_dir_path="$c_dir/configs"

echo 'setup....' &&  {
	# install require packages. 
	. "${configs_dir_path}/package/setup.sh"

	# install package manager.
	. "${configs_dir_path}/brew/setup.sh"

	# setups
	local packages=(git brew mac tmux vim prompt rust ssh)
	for target in "${packages[@]}";
	do
		echo "setup $target......"
		. "${configs_dir_path}/${target}/setup.sh"
	done
}

# link to user_bin.
#ln -sfn ${c_dir}/tool/bin $HOME/bin

