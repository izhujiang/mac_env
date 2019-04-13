#!/bin/sh

# 0. check prerequuisites before installation.
# printf "--------------------------------------------\n"
# printf "0. Check prerequuisites before installation.\n"

printf "updating brew and upgrade formulaes---------\n"
brew update && brew upgrade

# 1. install all libs, packages and tools
printf "Start installing libs, packages and tools......\n"

brew install cmake wget git xclip zsh autojump tmux httpie
brew install python3 pipenv go ruby node yarn jq 
# reattach-to-user-namespace support copy and pasty
brew install reattach-to-user-namespace astyle readline xz pcre openssl gd geoip

# springboot
# brew tap pivotal/tap
# brew install springboot

# install nginx, or install nginx manually from sourcecode, and fix --with-http_ssl_module bug referring to https://www.widlabs.com/article/mac-os-x-nginx-compile-symbol-not-found-for-architecture-x86_64
brew install nginx
# brew install vim --enable-pythoninterp=dynamic --enable-python3interp=dynamic
brew install vim
# maybe better choice for nvim
brew install neovim
# install vim with python3 support
