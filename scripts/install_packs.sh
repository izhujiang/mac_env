#!/bin/sh
# prerequuisites has been checked before installation.

# printf "--------------------------------------------\n"
SYSOS=`uname -s`

printf "updating brew and upgrade formulaes---------\n"
brew update && brew upgrade

# zsh should be installed as one of prerequisites
# brew install zsh zplug
# 1. install all libs, packages and tools
printf "Start installing libs, packages and tools......\n"
# brew install gcc cmake wget git xclip ripgrep bat fd z
brew install gcc cmake wget git xclip bat fd z
brew install tmux tmuxinator

brew install astyle readline xz pcre openssl gd geoip httpie

# brew install node yarn python3 pyenv pipenv go ruby rust jq
brew install node yarn python3 pyenv pipenv go ruby

if [ ${SYSOS} = "Linux" ] ; then
    # install rust
    curl https://sh.rustup.rs -sSf | sh
    printf "Updating ripgrep 11.0.2 to 12.0.0 failed in homebrew Ubuntu due to asciidoc, install ripgrep later plz..."
elif [ ${SYSOS} = "Darwin" ] ; then
    brew install ripgrep
    # reattach-to-user-namespace support copy and pasty
    brew install autojump reattach-to-user-namespace
    brew install rust
else
    printf "autojump rust and reattach-to-user-namespace ...  not installed on %s...\n" ${SYSOS}
fi

# Install fzf, A command-line fuzzy finder.
# An interactive Unix filter for command-line that can be used with any list: files, command history, processes, hostnames, bookmarks, git commits, etc.
brew install fzf diff-so-fancy
# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install --all

# install nginx, or install nginx manually from sourcecode, and fix --with-http_ssl_module bug referring to https://www.widlabs.com/article/mac-os-x-nginx-compile-symbol-not-found-for-architecture-x86_64
brew install nginx
# brew install vim --enable-pythoninterp=dynamic --enable-python3interp=dynamic
brew install vim
# maybe better choice for nvim
brew install neovim
# install vim with python3 support

# install vscode
if [ ${SYSOS} = "Darwin" ] ; then
    brew cask install visual-studio-code
    # install other useful tools
    # brew cask install alfred
    # brew install springboot
elif [ ${SYSOS} = "Linux" ] ; then
    printf "install vscode with sudo privilege in GUI mode, following the instruction: \n"
    printf "https://code.visualstudio.com/docs/setup/linux\n"
else
    printf "vscode only support window, linux and macOS.\n"
fi
