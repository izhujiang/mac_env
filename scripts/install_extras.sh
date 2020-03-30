#!/bin/sh
# Install 3d-party packages for Python, Node.js, Ruby, Zsh and vim/nvim.

SYSOS=`uname -s`
# install python 3rd party packages
printf "install 3d-party packages for python...... \n"
# pip3 install -U pipenv
pip3 install -U flake8
pip3 install -U future
pip3 install -U pep8
pip3 install -U jedi
pip3 install -U mock
pip3 install -U nose
pip3 install -U PyHamcrest
pip3 install -U powerline-status
pip3 install -U neovim
pip3 install -U neovim-remote

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
npm install -g grunt-cli
npm install -g neovim
npm install -g gatsby-cli
npm install -g surge
npm install -g lighthouse


printf "install go tools packages...... \n"
export GOPATH=$HOME/workspace/go
printf "install tools to GOPATH(${GOPATH}) for golang ...... \n"
go get -u golang.org/x/lint/golint
go get -u golang.org/x/tools/cmd/godoc
go get -u golang.org/x/tools/cmd/goimports
go get -u golang.org/x/tools/cmd/gorename
go get -u golang.org/x/tools/cmd/guru
go get -u golang.org/x/blog

go get -u github.com/acroca/go-symbols
# go get -u github.com/alecthomas/gometalinter
# gometalinter --install
# using golangci-lint instead of gemetalinter
go get -u golangci/golangci-lint
go get -u github.com/cweill/gotests/...
go get -u github.com/davidrjenni/reftools/cmd/fillstruct
go get -u github.com/go-delve/delve/cmd/dlv
go get -u github.com/fatih/gomodifytags
# go get -u github.com/gobuffalo/buffalo/buffalo
go get -u github.com/haya14busa/goplay/cmd/goplay
go get -u github.com/josharian/impl
go get -u github.com/kisielk/errcheck
go get -u github.com/mdempsky/gocode
go get -u github.com/nsf/gocode
go get -u github.com/ramya-rao-a/go-outline
go get -u github.com/rogpeppe/godef
go get -u github.com/sqs/goreturns
go get -u github.com/tpng/gopkgs
go get -u github.com/uudashr/gopkgs/cmd/gopkgs
go get -u github.com/zmb3/goaddimport
go get -u github.com/zmb3/gogetdoc
go get -u sourcegraph.com/sqs/goreturns

printf "install extension for code ...... \n"
if [ ${SYSOS} = "Darwin" ] ; then
    code --install-extension ms-vscode.go
else
    printf "todo: check if vscode exists..."
    # code --install-extension ms-vscode.go
    printf "install vscode with sudo privilege in GUI mode, following the instruction: \n"
fi
