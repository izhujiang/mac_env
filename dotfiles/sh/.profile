# profile for login shell, source by .bash_profile and linked by .zprofile
# set variables or init environment when login
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
unset LC_CTYPE
export SSH_KEY_PATH=${HOME}/.ssh/rsa_id

# export HOMEBREW_PREFIX=${HOMEBREW}
# export HOMEBREW_CELLAR=${HOMEBREW_CELLAR}
# export HOMEBREW_REPOSITORY=${HOMEBREW_REPOSITORY}
# export MANPATH=${HOMEBREW}/share/man:${MANPATH}
# export INFOPATH=${HOMEBREW}/share/info:${INFOPATH}
# export PATH=${HOMEBREW}/bin:${HOMEBREW}/sbin:${PATH}
export PATH=${HOMEBREW_PREFIX}/opt/openssl@1.1/bin:${PATH}
export XML_CATALOG_FILES=${HOMEBREW_PREFIX}/etc/xml/catalog
# opt out of Homebrew’s analytics
export HOMEBREW_NO_ANALYTICS=1


# 3. ide-level env and tools
export PATH="${HOME}/.cargo/bin:$PATH"

# golang
# export GOROOT=$HOME/repo/golang/go
export GOPATH=${HOME}/workspace/go
export PATH=${PATH}:$(go env GOPATH)/bin

# python
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi
# eval "$(pyenv init -)"
