set -eu

: "setup hyper" && {
  c_dir=$(pwd)
  ln -sfn  ${c_dir}/hyper.js $HOME/.hyper.js
}
