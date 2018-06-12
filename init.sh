#!/bin/sh
set -e

git clone https://github.com/shinoyu/dotfiles
cd dotfiles

sh ./post_init
sh ./install.sh


