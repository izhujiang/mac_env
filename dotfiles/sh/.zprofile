# init global environment variables when login zsh
# don't edit .zprofile, custom with ".zprofile.local" instead.
test -e "${HOME}/.xprofile" && . "${HOME}/.xprofile"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
test -s ${HOMEBREW_PREFIX}/etc/profile.d/autojump.sh  && source ${HOMEBREW_PREFIX}/etc/profile.d/autojump.sh

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

# add fzf to zsh
[ -f ~/.fzf.zsh ] && . ~/.fzf.zsh

test -e "${HOME}/.zprofile.local" && . "${HOME}/.zprofile.local"
