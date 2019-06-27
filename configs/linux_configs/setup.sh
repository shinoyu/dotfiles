#!/bin/sh
set -e

local_script_dir=$(cd $(dirname $0); pwd) 
local_target_dir=${XDG_CONFIG_HOME:-$HOME/.config}

mkdir -p ${local_target_dir}/i3 && ln -sf ${local_script_dir}/i3.config ${local_target_dir}/i3/config
mkdir -p ${local_target_dir}/i3status && ln -sf ${local_script_dir}/i3status.config ${local_target_dir}/i3status/config
ln -sf ${local_script_dir}/xmodmap $HOME/.xmodmap
ln -sf ${local_script_dir}/xinitrc $HOME/.xinitrc