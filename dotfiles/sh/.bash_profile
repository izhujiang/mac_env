# init global environment variables when login bash
# don't edit .bash_profile, custom with ".bash_profile.local" instead.
test -e "${HOME}/.env" && . "${HOME}/.env"
test -e "${HOME}/.xprofile" && . "${HOME}/.xprofile"

export CLICOLOR=1
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
test -e "${HOME}/.iterm2_shell_integration.bash" && . "${HOME}/.iterm2_shell_integration.bash"

POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1

test -e "${HOME}/.bash_profile.local" && . "${HOME}/.bash_profile.local"

test -e "${HOME}/.bashrc" && . "${HOME}/.bashrc"
