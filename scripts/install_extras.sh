#!/bin/sh

# Install 3d-party packages for Python, Node.js, Ruby, Zsh and vim/nvim.

# install python 3rd party packages
printf "install 3d-party packages for python...... \n"
pip3 install --user pipenv
pip3 install --user flake8
pip3 install --user future
pip3 install --user pep8
pip3 install --user jedi
pip3 install --user mock
pip3 install --user nose
pip3 install --user PyHamcrest
pip3 install --user powerline-status
pip3 install --user neovim

# install gem 3d party packages
printf "install 3d-party packages for ruby...... \n"
# gem install html2haml
# gem install sass
# sudo gem install html2haml
# sudo gem install sass

# install node.js 3d party packages
printf "install nodejs 3d-party packages...... \n"
yarn global add typescript
yarn global add create-react-app
yarn global add npx
yarn global add serve
yarn global add react-devtools
yarn global add eslint
yarn global add prettier
yarn global add js-beautify
yarn global add js2coffee
yarn global add commander
yarn global add async
yarn global add rimraf
yarn global add winston
yarn global add colors
yarn global add simplehttpserver
yarn global add mongo-hacker
yarn global add npx
yarn global add grunt-cli
yarn global add neovim
yarn global add gatsby-cli
yarn global add surge


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
