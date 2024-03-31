#!/bin/bash
set -u

c_dir=$(cd $(dirname $0); pwd)
configs_dir_path="$c_dir/configs"

# init user dir.
ln -sf  ${configs_dir_path}/zshenv $HOME/.zshenv && \
    ln -sf  ${configs_dir_path}/zshenv $HOME/.bash_profile

# link to user dir.
ln -sfn ${configs_dir_path}/zsh $HOME/.zsh
ln -sf  ${configs_dir_path}/tigrc $HOME/.tigrc
ln -sfn ${configs_dir_path}/bash_ext $HOME/.bash_ext
ln -sfn ${configs_dir_path}/vim $HOME/.vim
ln -sf  ${configs_dir_path}/vimrc $HOME/.vimrc

# create local settings files.
local zsh_local_resource="$ZDOTDIR/zsh.local"
if test -f $zsh_local_resource; then
    : none
else
    touch $zsh_local_resource && \ 
        ln -sfn  $zsh_local_resource $HOME/.zshrc && \
        echo "create $zsh_local_resource"
fi


bash -c '. setup.sh'
