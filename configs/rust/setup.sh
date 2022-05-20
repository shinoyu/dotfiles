#!/bin/bash
set -e

: "setup rust" && {
rust_tools=(
    bat
    exa
    lsd
)
install_rustup() {
    curl https://sh.rustup.rs -sSf | sh
}
install_tools() {
    for item in "${rust_tools[@]}"
    do 
        echo "install $item....."
        cargo install $item
    done
}

install_rustup
install_tools
}

