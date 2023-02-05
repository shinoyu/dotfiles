set -u

# : "install" && {
#   brew reinstall --cask alacritty
# }

: "setup" && {
  c_dir=$(cd $(dirname $0); pwd)
	to_dir=$HOME/.config/alacritty
	mkdir -p ${to_dir}
  ln -sf $c_dir/alacritty.yml $to_dir/alacritty.yml
}
