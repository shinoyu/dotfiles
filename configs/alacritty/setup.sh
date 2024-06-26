set -u

: "install" && {
  brew install --cask alacritty
}

: "setup" && {
  c_dir=$(cd $(dirname $0); pwd)
	to_dir=$HOME/.config/alacritty
	mkdir -p ${to_dir}
  ln -sf $c_dir/alacritty.toml $to_dir/alacritty.toml
}
