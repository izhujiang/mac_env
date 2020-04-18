# When  an  interactive  shell  that is not a login shell is started, bash reads and executes commands from ${HOME}/.bashrc, if that file exists.
# user's .bashrc script usually set personal preferences for the command line for interactive shell: custom prompt, specific color scheme...
[ -e ${HOME}/.xshrc ] && . ${HOME}/.xshrc

export CLICOLOR=1
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
test -e "${HOME}/.iterm2_shell_integration.bash" && . "${HOME}/.iterm2_shell_integration.bash"
[ -e ${HOME}/.fzf.bash ] && . ${HOME}/.fzf.bash

POWERLINE_BASH=${PY_PACKS_LOC}/powerline/bindings/bash/powerline.sh
test -e ${POWERLINE_BASH} && . ${POWERLINE_BASH}

[ -e ${HOME}/.local/scripts/.shtk.local ] && (. ${HOME}/.local/scripts/.shtk.local ; export BASH_EVN="${HOME}/.local/scripts/.shtk.local" )
[ -e ${HOME}/.local/scripts/.bashrc.local ] && . ${HOME}/.local/scripts/.bashrc.local