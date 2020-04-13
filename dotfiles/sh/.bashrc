# When  an  interactive  shell  that is not a login shell is started, bash reads and executes commands from ~/.bashrc, if that file exists.
[ -f ~/.xshrc ] && . ~/.xshrc
[ -f ~/.fzf.bash ] && . ~/.fzf.bash
