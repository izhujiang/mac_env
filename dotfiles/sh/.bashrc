# When  an  interactive  shell  that is not a login shell is started, bash reads and executes commands from ~/.bashrc, if that file exists.
# user's .bashrc script usually set personal preferences for the command line for interactive shell: custom prompt, specific color scheme...
[ -f ~/.xshrc ] && . ~/.xshrc
[ -f ~/.fzf.bash ] && . ~/.fzf.bash

POWERLINE_BASH=${PY_PACKS_LOC}/powerline/bindings/bash/powerline.sh
test -e ${POWERLINE_BASH} && . ${POWERLINE_BASH}

[ -f ~/.bashrc.local ] && . ~/.bashrc.local
