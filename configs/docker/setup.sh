#!/bin/zsh
# TODO: ubuntu only
set -e
: "setup_docker" && {

install_build_libs() {
    echo "docker: install docker build libs...\n"
    sudo apt update && sudo apt -y install \
        ca-certificates \
        curl \
        apt-transport-https \
        gnupg-agent \
        software-properties-common
}

remove_old_version() {
    echo "docker: remove old docker versions....\n"
    sudo apt remove docker docker-engine docker.io containerd runc
}

install_docker() {
    echo "\ndocker: add install docker....\n"
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
            $(lsb_release -cs) \
            stable"

    echo "docker: install docker\n"
    sudo apt -y install \
        docker-ce \
        docker-compose
}

install_build_libs
cmd_exists docker && remove_old_version
install_docker

}