#!/bin/bash
set -u

: "setup hyper" && {
  c_dir=$(cd $(dirname $0); pwd)
  ln -sfn  ${c_dir}/hyper.js $HOME/.hyper.js
}
