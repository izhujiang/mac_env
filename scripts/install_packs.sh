#!/bin/sh
set -u

# prerequuisites has been checked before installation.
# printf "--------------------------------------------\n"
SYSOS=$(uname -s)

printf "Updating brew and upgrade formulaes ...\n"
brew update && brew upgrade

# zsh should be installed as one of prerequisites
# brew install zsh zplug
# 1. install all libs, packages and tools
printf "\nStart installing libs, packages and tools ...\n"
# brew install binutils gcc cmake curl wget git
brew install gcc cmake curl wget git tldr
brew install astyle pcre gd httpie asciidoc xmlto
brew install tmux tmuxinator

brew install ripgrep bat fd z broot

# Install fzf, A command-line fuzzy finder.
# An interactive Unix filter for command-line that can be used with any list: files, command history, processes, hostnames, bookmarks, git commits, etc.
brew install fzf diff-so-fancy
brew install ncdu prettyping htop
# To install useful key bindings and fuzzy completion:
"$(brew --prefix)/opt/fzf/install" --all

# ycmd has builtin llvm/clangd
# brew install llvm
brew install perl
brew install node yarn
brew install python3 pyenv pipenv
# build CPython with shared library with --enable-framework required by YouCompleteMe ycmd server and other 3rd party tools, if use python in pyenv.
# env PYTHON_CONFIGURE_OPTS="--enable-framework" pyenv install 3.8.2
# pyenv global 3.8.2
brew install go

if [ "${SYSOS}" = "Linux" ] ; then
    # install rust
    # printf "Updating ripgrep 11.0.2 to 12.0.0 failed in homebrew Ubuntu due to asciidoc, install ripgrep later plz ...\n"
    brew install bzip2 libffi libxml2 libxmlsec1
    # install into ${HOME}/.cargo, for linuxbrew doesn't support rust
    curl https://sh.rustup.rs -sSf | sh -s -- -yq --no-modify-path

    brew install xclip
elif [ "${SYSOS}" = "Darwin" ] ; then
    # reattach-to-user-namespace support copy and pasty
    brew install autojump reattach-to-user-namespace
    brew install rust
    brew install gnupg
else
    printf "autojump rust and reattach-to-user-namespace ...  not installed on %s ...\n" "${SYSOS}"
fi


# install nginx, or install nginx manually from sourcecode, and fix --with-http_ssl_module bug referring to https://www.widlabs.com/article/mac-os-x-nginx-compile-symbol-not-found-for-architecture-x86_64
brew install luarocks nginx
# install vim with python3 support
# brew install vim --enable-pythoninterp=dynamic --enable-python3interp=dynamic
# YouCompleteMe provides more semantic IDE-like features (displaying signature help and documentation) with vim only, wait for new version
brew install vim
# maybe better choice for nvim
brew install neovim

brew instal jq


# install platform-specific tools
if [ "${SYSOS}" = "Darwin" ] ; then
    brew cask install iterm2
    brew cask install google-chrome
    brew cask install visual-studio-code

    # install other useful tools
    # brew cask install alfred
    # brew install springboot
elif [ "${SYSOS}" = "Linux" ] ; then
    printf "Install vscode with sudo privilege in GUI mode, following the instruction: \n"
    printf "https://code.visualstudio.com/docs/setup/linux\n"
else
    printf "vscode only support window, linux and macOS.\n"
fi
