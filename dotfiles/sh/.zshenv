# zsh load .zshenv, .zprofile(login shell), .zshrc(interactive shell) and .zlogin(login shell) sequentially
test -e "${HOME}/.env" && . "${HOME}/.env"
test -e "${HOME}/.shtk.local" && . "${HOME}/.shtk.local"
