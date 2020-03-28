# zmodload zsh/zprof
# PS4=$'\\\011%D{%s%6.}\011%x\011%I\011%N\011%e\011'
# exec 3>&2 2>/tmp/zshstart.$$.log
# setopt xtrace prompt_subst

# debug
# cur_sec_and_ns=`gdate '+%s-%N'`
# cur_sec=${cur_sec_and_ns%-*}
# cur_ns=${cur_sec_and_ns##*-}
# cur_timestamp=$((cur_sec*1000+cur_ns/1000000))
# start=$cur_timestamp
# echo 1 $cur_timestamp

# init global environment variables
source ${HOME}/.env

# Path to your oh-my-zsh installation.
export ZSH=${HOME}/.oh-my-zsh

# [oh-my-zsh] Insecure completion-dependent directories detected:
# [oh-my-zsh] If the above didn't help or you want to skip the verification of
# [oh-my-zsh] insecure directories you can set the variable ZSH_DISABLE_COMPFIX to
# [oh-my-zsh] "true" before oh-my-zsh is sourced in your zshrc file.
ZSH_DISABLE_COMPFIX=true

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="powerline"
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-completions extract vi-mode docker)
plugins=(zsh-autosuggestions zsh-syntax-highlighting zsh-completions forgit)

# oh-my-zsh takes 131ms, and 235ms with plugins
source ${ZSH}/oh-my-zsh.sh

# tmp=$cur_timestamp
# cur_sec_and_ns=`gdate '+%s-%N'`
# cur_sec=${cur_sec_and_ns%-*}
# cur_ns=${cur_sec_and_ns##*-}
# cur_timestamp=$((cur_sec*1000+cur_ns/1000000))
# echo "source oh-my-zsh" $((cur_timestamp - tmp))

# zplug takes 270ms
# export ZPLUG_HOME=/usr/local/opt/zplug
# source $ZPLUG_HOME/init.zsh
# source ${HOME}/.zplug

# earse env variables $PAGER and $LESS setted by oh-my-zsh, which cause git branch/diff's output paged by less
unset PAGER
unset LESS

set -o vi
bindkey -v

# man page highlight
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
test -s ${HOMEBREW_PREFIX}/etc/profile.d/autojump.sh  && . ${HOMEBREW_PREFIX}/etc/profile.d/autojump.sh
#
# Setting for autosuggestions
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=blue'

# if test -z ${PY_PACKS_LOC}
# then
#     echo "powerline-status does not exist, install it with pip3 install powerline-status"
# else
#     POWERLINE_ZSH=${PY_PACKS_LOC}/powerline/bindings/zsh/powerline.zsh
#     # echo $POWERLINE_ZSH
#     # source ${POWERLINE_ZSH}
# fi

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

# add fzf to zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# customize local profile
source ${HOME}/.profile.local
# unsetopt xtrace
# exec 2>&3 3>&-

# zprof
