set -u

: "install" && {
  brew cask install alacritty
}

: "setup" && {
  c_dir=$(pwd)
	to_dir=$HOME/.config/alacritty
	mkdir -p ${to_dir}
  ln -sfn ${c_dir}/alacritty.yml ${to_dir}/alacritty.yml
}