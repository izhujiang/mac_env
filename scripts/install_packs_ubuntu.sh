#!/bin/bash

sudo apt update -y && sudo apt upgrade -y

sudo apt install -y cmake autoconf curl wget zsh git xclip net-tools ack libtool libtool-bin libbz2-dev zlib1g-dev libgd-dev libreadline-dev libsqlite3-dev libssl-dev cargo

# To be able to use add-apt-repository, need to install software-properties-common
sudo apt install -y software-properties-common
# support vim to enable the built-in autocomplete and spell
sudo apt install spell
# ppa:neovim-ppa/stable to your system's Software Sources
sudo add-apt-repository -y ppa:neovim-ppa/stable

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list


sudo apt install -y python3 python3-dev python3-pip ruby ruby-html2haml ruby-dev default-jdk golang nodejs npm yarn jq

# echo "Download Oracle JDK from oracle website and install it to ${HOME}/java like ${HOME}/java/jdk-10, if you prefer oracle jdk instead."

# curl -s "https://get.sdkman.io" | bash
# source "/home/hurricane/.sdkman/bin/sdkman-init.sh"
# sdk install gradle

sudo apt install -y tmux autojump astyle

sudo apt install -y libpcre3 libpcre3-dev openssl libssl-dev libcanberra-gtk-module
echo "You may install nginx from sourcecode instead."
sudo apt install -y nginx

sudo apt install -y powerline fonts-powerline
sudo apt install -y vim neovim
