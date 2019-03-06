#!/bin/bash -eu

: "setup tmux.conf" && { 
	c_dir=$(pwd)

	mkdir -p $HOME/.tmux
	ln -sf  ${c_dir}/tmux.conf $HOME/.tmux.conf
	ln -sf  ${c_dir}/tmux-$L_OSTYPE.conf $HOME/.tmux/tmux-$L_OSTYPE.conf
}