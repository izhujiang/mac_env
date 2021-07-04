#!/bin/sh
set -u

# Install 3d-party packages for Python, Node.js, Ruby, Zsh and vim/nvim.

installPythonPackages(){
    # install python 3rd party packages
    printf "install 3d-party packages for python...... \n"
    printf "current pip3: %s\n" "$(which pip3)"
    pip3 install -U pip
    # pip3 install -U pipenv
    pip3 install -U flake8
    pip3 install -U future
    pip3 install -U pep8
    pip3 install -U jedi
    pip3 install -U mock
    pip3 install -U nose
    pip3 install -U PyHamcrest
    pip3 install -U powerline-status
    pip3 install -U pynvim
    # pip3 install -U neovim
    pip3 install -U neovim-remote
    # https://pypi.org/project/imgcat/
    pip3 install -U imgcat
}

installRubyPackages(){
    # install gem 3d party packages
    printf "install 3d-party packages for ruby ...\n"
    # gem install html2haml
    # gem install sass
    # sudo gem install html2haml
    # sudo gem install sass
}

installNodejsPackages(){
    # install node.js 3d party packages
    printf "install nodejs 3d-party packages ...\n"
    printf "change npm global repository where node_modules stored ...\n"

    npm config set prefix "${HOME}/.local"
    test -d "${HOME}/.local/lib" || mkdir "${HOME}/.local/lib"

    npm install -g npm
    # git commit message guidelines:
    # https://github.com/commitizen/cz-cli
    # https://gist.github.com/abravalheri/34aeb7b18d61392251a2
    npm install -g neovim
    npm install -g commitizen cz-conventional-changelog
    # Generate changelogs and release notes. https://github.com/conventional-changelog/conventional-changelog
    npm install -g conventional-changelog

    npm install -g typescript
    npm install -g create-react-app
    npm install -g react-devtools
    npm install -g serve
    npm install -g eslint
    npm install -g prettier
    npm install -g js-beautify
    # command-line interfaces
    # npm install -g commander
    # npm install -g async
    # The UNIX command rm -rf for node
    # npm install -g rimraf
    # A logger for just about everything.
    # npm install -g winston
    # npm install -g colors
    # MongoDB Shell Enhancements
    npm install -g mongo-hacker
    npm install -g grunt-cli
    # Nvim Node.js client and plugin host
    # npm install -g neovim
    npm install -g gatsby-cli
    # Static web publishing for Front-End Developers
    npm install -g surge
    # The Node CLI provides the most flexibility in how Lighthouse runs can be configured and reported.
    # Users who want more advanced usage, or want to run Lighthouse in an automated fashion should use the Node CLI.
    npm install -g lighthouse
}

installGolangPackages(){
    printf "install go tools packages ...\n"
    export GOPATH=$HOME/workspace/go
    # fix issure: cannot use path@version syntax in GOPATH mode
    export GO111MODULE=on

    printf "install tools to GOPATH(%s) for golang ...\n" "${GOPATH}"
    go get golang.org/x/tools/gopls
    go get golang.org/x/tools/cmd/godoc
    go get golang.org/x/tools/cmd/goimports
    go get golang.org/x/tools/cmd/gorename
    go get golang.org/x/tools/cmd/guru
    go get golang.org/x/lint/golint
    go get golang.org/x/blog

    go get github.com/acroca/go-symbols
    # using golangci-lint instead of gemetalinter
    # go get -u github.com/alecthomas/gometalinter
    # go get github.com/golangci/golangci-lint/cmd/golangci-lint@v1.33.0
    go get github.com/golangci/golangci-lint/cmd/golangci-lint    # no -u
    go get github.com/cweill/gotests
    go get github.com/davidrjenni/reftools/cmd/fillstruct
    go get github.com/go-delve/delve/cmd/dlv
    go get github.com/fatih/gomodifytags
    # go get -u github.com/gobuffalo/buffalo/buffalo
    go get github.com/haya14busa/goplay/cmd/goplay
    go get github.com/josharian/impl
    go get github.com/kisielk/errcheck
    go get github.com/mdempsky/gocode
    go get github.com/nsf/gocode
    go get github.com/ramya-rao-a/go-outline
    go get github.com/rogpeppe/godef
    go get github.com/sqs/goreturns
    go get github.com/tpng/gopkgs
    go get github.com/uudashr/gopkgs/cmd/gopkgs
    go get github.com/zmb3/goaddimport
    go get github.com/zmb3/gogetdoc
    go get github.com/stamblerre/gocode

    go get sourcegraph.com/sqs/goreturns
}

installVscodePlugins () {
    command -v code > /dev/null 2>&1 || return 1

    printf "install extension for code ...\n"
    code --install-extension ms-vscode.go
    code --install-extension bmuskalla.vscode-tldr
    code --install-extension vscodevim.vim

    SYSOS=$(uname -s)
    if [ "${SYSOS}" = "Darwin" ] ; then
        # To enable key-repeating, ref https://github.com/VSCodeVim/Vim
        defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
    fi

    printf "todo: install more extensions for vscode.\n"
}

installExtensivePackages(){
    installPythonPackages
    installRubyPackages
    installNodejsPackages
    installGolangPackages
    installVscodePlugins || return 1
}

installExtensivePackages
