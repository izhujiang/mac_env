#!/bin/sh

# 0. check prerequuisites before installation.
# printf "--------------------------------------------\n"
# printf "0. Check prerequuisites before installation.\n"

printf "updating brew and upgrade formulaes---------\n"
brew update && brew upgrade

# 1. install all libs, packages and tools
printf "Start installing libs, packages and tools......\n"

brew install cmake wget git xclip ripgrep bat fd z
brew install zsh
# brew install zsh zplug

printf "put the installed zsh into /etc/shells, then the command `chsh -s $(which zsh)` does work.\n"
# grep -q "$(which zsh)" /etc/shells || sudo -s "echo $(which zsh) >> /etc/shells" && chsh -s $(which zsh)
grep -q "$(which zsh)" /etc/shells || sudo -s "echo $(which zsh) >> /etc/shells"

brew install autojump tmux tmuxinator httpie
brew install python3 pipenv go ruby rust node yarn jq

# reattach-to-user-namespace support copy and pasty
brew install reattach-to-user-namespace astyle readline xz pcre openssl gd geoip

# Install fzf, A command-line fuzzy finder.
# An interactive Unix filter for command-line that can be used with any list:
# files, command history, processes, hostnames, bookmarks, git commits, etc.
brew install fzf
# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install

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

# install vscode
brew cask install visual-studio-code

brew install pyenv

# install other useful tools
# brew cask install alfred
