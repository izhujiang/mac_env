# init global environment variables when login bash
# don't edit .bash_profile, custom with ".bash_profile.local" instead.
test -e "${HOME}/.env" && . "${HOME}/.env"
test -e "${HOME}/.xprofile" && . "${HOME}/.xprofile"


POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1

test -e "${HOME}/.local/scripts/.bash_profile.local" && . "${HOME}/.local/scripts/.bash_profile.local"

test -e "${HOME}/.bashrc" && . "${HOME}/.bashrc"
