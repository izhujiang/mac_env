# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=${HOME}/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerline"

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
# plugins=(git zsh-autosuggestions)
# plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-completions extract vi-mode docker)
plugins=(zsh-autosuggestions zsh-syntax-highlighting zsh-completions
        git git-flow golang docker tmux )
source ${ZSH}/oh-my-zsh.sh
# earse env variables $PAGER and $LESS setted by oh-my-zsh, which cause git branch/diff's output paged by less
unset PAGER
unset LESS

set -o vi
bindkey -v

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# dirname and leadlink just deal literally with the given file or softlink, that will return back wrong path when ln -s with relative path
# rcfile="${HOME}/.zshrc"
# if [ -L $rcfile ] ; then
# 	export MY_ENV_ROOT=$(dirname $(dirname $(dirname $(readlink ${rcfile}))))
#     echo $MY_ENV_ROOT
# else
# 	export MY_ENV_ROOT=$(dirname $(dirname $(dirname ${rcfile})))
# fi
export MY_ENV_ROOT=${HOME}/repo/my_env
source ${MY_ENV_ROOT}/dotfiles/sh/.common_shrc

# man page highlight
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

SYSOS=`uname -s`
if [ ${SYSOS} = "Linux" ] ; then
  # for ubuntu
  [ -f /usr/share/autojump/autojump.sh ] && source /usr/share/autojump/autojump.sh
  export JAVA_HOME=/opt/jdk/jdk-11
  export CLASSPATH=${JAVA_HOME}/lib
  export PATH=${JAVA_HOME}/bin:$PATH
  # export JAVA_HOME=~/java/jdk-10
  # export PATH=${JAVA_HOME}/bin:${PATH}
elif [ ${SYSOS} = "Darwin" ] ; then
  # enable autojump
  # for mac
  [[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
else
  echo "other OS: ${SYSOS}"
fi

#
# Setting for autosuggestions
#
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=blue'

# source /usr/local/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh
PY_PACKS_LOC=$(pip3 show powerline-status | grep Location)
# PY_PACKS_LOC=$(pip show powerline-status | grep Location)
PY_PACKS_LOC=${PY_PACKS_LOC##*Location: }
POWERLINE_ZSH=${PY_PACKS_LOC}/powerline/bindings/zsh/powerline.zsh
# echo '/usr/local/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh'

# echo ${POWERLINE_ZSH}
source ${POWERLINE_ZSH}

function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/hurricane/.sdkman"
[[ -s "/home/hurricane/.sdkman/bin/sdkman-init.sh" ]] && source "/home/hurricane/.sdkman/bin/sdkman-init.sh"
