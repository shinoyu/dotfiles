#!/bin/bash
: "setup" && {
  c_dir=$(cd $(dirname $0); pwd)
  to_dir=$HOME/.config/sheldon
  echo "c_dir: ${c_dir}"
  echo "to_dir: ${to_dir}"
  mkdir -p ${to_dir}
  ln -sf ${c_dir}plugins.toml ${to_dir}plugins.toml
}
