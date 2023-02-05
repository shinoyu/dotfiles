#!/bin/bash
set -u

: "settings tmux" && {

c_dir=$(cd $(dirname $0); pwd)
init_tmux() {
	export TMUX_PLUGIN_MANAGER_PATH=$HOME/.tmux/plugins
	mkdir -p $TMUX_PLUGIN_MANAGER_PATH
}
setup_conf() {
	to_dir=$HOME/.config/tmux
	mkdir -p $to_dir
	ln -sf  $c_dir/tmux.conf $to_dir/tmux.conf
	ln -sf  $c_dir/tmux-$L_OSTYPE.conf $to_dir/tmux-$L_OSTYPE.conf
	ln -sf  $c_dir/plugins.conf $to_dir/plugins.conf
}

install_plugin_packages() {
	if type git >/dev/null; then
		if ! test -e $TMUX_PLUGIN_MANAGER_PATH/tpm; then
			git clone https://github.com/tmux-plugins/tpm $TMUX_PLUGIN_MANAGER_PATH/tpm && $TMUX_PLUGIN_MANAGER_PATH/tpm/bin/install_plugins
		fi
	else
		echo "warning!! require git. skip ====>"
	fi
}

echo "== run tmux settings.... ===================\n"
init_tmux
setup_conf
echo "== install plugin manager.... ==============\n"
install_plugin_packages
echo "== finish tmux settings!! ==================\n"

}
