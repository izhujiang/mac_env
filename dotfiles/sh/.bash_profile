# init global environment variables
source ${HOME}/.env


export CLICOLOR=1
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1

#source /usr/local/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh
# PY_PACKS_LOC=$(pip3 show powerline-status | grep Location)
# PY_PACKS_LOC=${PY_PACKS_LOC##*Location: }
POWERLINE_BASH=${PY_PACKS_LOC}/powerline/bindings/bash/powerline.sh
# echo '/usr/local/lib/python3.6/site-packages/powerline/bindings/bash/powerline.zsh'

test -e "${HOME}/.profile.local" && source "${HOME}/.profile.local"
test -e ${POWERLINE_BASH} source ${POWERLINE_BASH}
