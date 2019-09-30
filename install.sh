#!/bin/sh
set -e
set -u

c_dir=$(cd $(dirname $0); pwd)
configs_dir_path="$c_dir/configs"

# install require packages. 
bash "${configs_dir_path}/package/setup.sh" 
if ! type brew >/dev/null 1>&2; then 
	echo "require brew!! Please restart after installing brew."
	exit 1
fi

# install package manager.
sh "${configs_dir_path}/brew/setup.sh"

# init user dir.
ln -sf  ${configs_dir_path}/zshenv $HOME/.zshenv
ln -sf  ${configs_dir_path}/zshenv $HOME/.bash_profile

# link to user dir.
ln -sfn ${configs_dir_path}/zsh $HOME/.zsh
ln -sf  ${configs_dir_path}/tigrc $HOME/.tigrc
ln -sfn ${configs_dir_path}/bash_ext $HOME/.bash_ext
ln -sfn ${configs_dir_path}/vim $HOME/.vim
ln -sf  ${configs_dir_path}/vimrc $HOME/.vimrc

# git settings
sh "${configs_dir_path}/mac/setup.sh"
sh "${configs_dir_path}/git/setup.sh"
sh "${configs_dir_path}/hyper/setup.sh"
sh "${configs_dir_path}/tmux/setup.sh"

# link to user_bin.
#ln -sfn ${c_dir}/tool/bin $HOME/bin

# import git-prompt
if [ ! -e "$HOME/.git-prompt.sh" ]; then
	curl --insecure "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh" > ~/.git-prompt.sh
fi

