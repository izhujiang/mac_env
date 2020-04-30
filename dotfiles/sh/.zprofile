# init global environment variables when login zsh
# don't edit .zprofile, custom with ".zprofile.local" instead.
test -e "${HOME}/.xprofile" && . "${HOME}/.xprofile"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
test -e "${HOME}/.local/scripts/.zprofile.local" && . "${HOME}/.local/scripts/.zprofile.local"
