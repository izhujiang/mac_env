#!/bin/sh

printf "uninstall 3d-party packages for python...... \n"
pip3 uninstall -y neovim
pip3 uninstall -y jedi
pip3 uninstall -y pep8
pip3 uninstall -y powerline-status
pip3 uninstall -y PyHamcrest
pip3 uninstall -y nose
pip3 uninstall -y mock
pip3 uninstall -y future
pip3 uninstall -y flake8
pip3 uninstall -y pipenv
# uninstall gem 3d party packages
printf "uninstall 3d-party packages for ruby...... \n"
# gem uninstall html2haml
# gem uninstall sass
# sudo gem uninstall html2haml
# sudo gem uninstall sass

# uninstall node.js 3d party packages
printf "uninstall nodejs 3d-party packages...... \n"
yarn global remove typescript
yarn global remove create-react-app
yarn global remove npx
yarn global remove serve
yarn global remove react-devtools
yarn global remove eslint
yarn global remove prettier
yarn global remove js-beautify
yarn global remove js2coffee
yarn global remove commander
yarn global remove async yarn global remove rimraf
yarn global remove winston
yarn global remove colors
yarn global remove simplehttpserver
yarn global remove mongo-hacker
yarn global remove npx
yarn global remove grunt-cli
yarn global remove neovim
yarn global remove gatsby-cli
yarn global remove surge

# 1. uninstall all libs, packages and tools
printf "Start uninstalling libs, packages and tools......\n"

brew uninstall neovim vim nginx
brew uninstall fzf
brew uninstall reattach-to-user-namespace astyle readline xz pcre openssl gd
brew uninstall pipenv python3 go ruby rust jq yarn npm node
brew uninstall cmake wget git xclip zsh autojump tmux httpie

