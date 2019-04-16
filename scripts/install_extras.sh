#!/bin/sh

# Install 3d-party packages for Python, Node.js, Ruby, Zsh and vim/nvim.

# install python 3rd party packages
printf "install 3d-party packages for python...... \n"
pip3 install -U --user pipenv
pip3 install -U --user flake8
pip3 install -U --user future
pip3 install -U --user pep8
pip3 install -U --user jedi
pip3 install -U --user mock
pip3 install -U --user nose
pip3 install -U --user PyHamcrest
pip3 install -U --user powerline-status
pip3 install -U --user neovim

# install gem 3d party packages
printf "install 3d-party packages for ruby...... \n"
# gem install html2haml
# gem install sass
# sudo gem install html2haml
# sudo gem install sass

# install node.js 3d party packages
printf "install nodejs 3d-party packages...... \n"
npm install -g typescript
npm install -g create-react-app
npm install -g npx
npm install -g serve
npm install -g react-devtools
npm install -g eslint
npm install -g prettier
npm install -g js-beautify
npm install -g js2coffee
npm install -g commander
npm install -g async
npm install -g rimraf
npm install -g winston
npm install -g colors
npm install -g simplehttpserver
npm install -g mongo-hacker
npm install -g npx
npm install -g grunt-cli
npm install -g neovim
npm install -g gatsby-cli
npm install -g surge


export GOPATH=$HOME/workspace/go
printf "install tools to GOPATH(${GOPATH}) for golang ...... \n"
go get -u golang.org/x/tools/cmd/goimports
go get -u golang.org/x/tools/cmd/gorename
go get -u github.com/sqs/goreturns
go get -u github.com/nsf/gocode
go get -u github.com/alecthomas/gometalinter
go get -u github.com/zmb3/gogetdoc
go get -u github.com/zmb3/goaddimport
go get -u github.com/rogpeppe/godef
go get -u golang.org/x/tools/cmd/guru
go get -u github.com/fatih/gomodifytags
go get -u github.com/tpng/gopkgs

go get golang.org/x/tools/cmd/guru
go get github.com/derekparker/delve/cmd/dlv

go get -u -v github.com/gobuffalo/buffalo/buffalo
