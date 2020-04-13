# init global environment variables when login bash
test -e "${HOME}/.env" && . "${HOME}/.env"
test -e "${HOME}/.profile" && . "${HOME}/.profile"

export CLICOLOR=1
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
test -e "${HOME}/.iterm2_shell_integration.bash" && . "${HOME}/.iterm2_shell_integration.bash"

POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1

#source /usr/local/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh
# PY_PACKS_LOC=$(pip3 show powerline-status | grep Location)
# PY_PACKS_LOC=${PY_PACKS_LOC##*Location: }
POWERLINE_BASH=${PY_PACKS_LOC}/powerline/bindings/bash/powerline.sh

test -e ${POWERLINE_BASH} && . ${POWERLINE_BASH}
test -e "${HOME}/.bashrc" && . "${HOME}/.bashrc"
