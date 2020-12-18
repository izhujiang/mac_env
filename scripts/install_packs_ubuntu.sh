#!/bin/bash
set -u

sudo apt update -y && sudo apt upgrade -y

sudo apt install -y cmake autoconf curl wget zsh git xclip ack fzf bat fd-find spell shellcheck net-tools

sudo apt install -y libtool libtool-bin libbz2-dev zlib1g-dev libgd-dev libreadline-dev libsqlite3-dev libssl-dev
sudo apt install -y libpcre3 libpcre3-dev openssl libssl-dev libcanberra-gtk-module

# To be able to use add-apt-repository, need to install software-properties-common
sudo apt install -y apt-transport-https ca-certificates gnupg-agent software-properties-common

# cargo include rustc and rust-gdb
sudo apt install -y cargo python3 python3-dev python3-pip ruby ruby-html2haml ruby-dev default-jdk golang nodejs npm jq
# sudo curl https://sh.rustup.rs -sSf -y | sh -s -- -y

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
sudo add-apt-repository -y "deb https://dl.yarnpkg.com/debian/ stable main"
sudo apt remove cmdtest
sudo apt update -y && sudo apt install -y yarn

echo "Please install latast golang from sourcecode manually..."

# echo "Download Oracle JDK from oracle website and install it to ${HOME}/java like ${HOME}/java/jdk-10, if you prefer oracle jdk instead."
# curl -s "https://get.sdkman.io" | bash
# source "/home/hurricane/.sdkman/bin/sdkman-init.sh"
# sdk install gradle

sudo apt install -y tmux autojump astyle

echo "You may install nginx from sourcecode instead."
sudo apt install -y nginx

sudo apt install -y vim neovim

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository -y \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
# ppa:neovim-ppa/stable to your system's Software Sources, Before 18.04 Neovim has been added to a "Personal Package Archive" (PPA)
# sudo add-apt-repository -y ppa:neovim-ppa/stable
# update apt source after adding repository
sudo apt update -y

sudo apt install -y docker-ce docker-ce-cli containerd.io
# post-installation steps for linux
sudo usermod -aG docker "$USER"
newgrp docker

# post-installation
mkdir ~/.local/bin
ln -s /usr/bin/batcat "${HOME}/.local/bin/bat"
ln -s /usr/bin/fdfind "${HOME}/.local/bin/fd"

# enable fzf keybindings and fuzzy auto-completion for zsh and bash
echo "source /usr/share/doc/fzf/examples/key-bindings.zsh" >> "${HOME}/.local/scripts/.zshrc.local"
echo "source /usr/share/doc/fzf/examples/completion.zsh" >> "${HOME}/.local/scripts/.zshrc.local"
echo "source /usr/share/doc/fzf/examples/key-bindings.zsh" >> "${HOME}/.local/scripts/.bashrc.local"
echo "source /usr/share/doc/fzf/examples/completion.zsh" >> "${HOME}/.local/scripts/.bashrc.local"
