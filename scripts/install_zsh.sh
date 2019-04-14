#!/bin/sh

# install zsh, ohmyzsh and powerline as well as its custom plugins
printf "install oh-my-zsh, powerline and other plugins for zsh ...... \n"

# install zsh plugins
printf "installing plugins for zsh\n"
export ZSH=${HOME}/.oh-my-zsh
export ZSH_CUSTOM=${ZSH}/custom
MY_ENV_ROOT=${HOME}/repo/my_env

printf "ZSH_CUSTOM: ${ZSH_CUSTOM} ......\n"
for plugin in zsh-autosuggestions zsh-syntax-highlighting zsh-completions
do
  if [ ! -d ${ZSH_CUSTOM}/plugins/${plugin} ]; then
    git clone git://github.com/zsh-users/${plugin} ${ZSH_CUSTOM}/plugins/${plugin}
  else
    cd ${ZSH_CUSTOM}/plugins/${plugin}
    git pull
  fi
done

printf "install oh-my-zsh-powerline-theme status......\n"
POWERLINE_THEME=${HOME}/.oh-my-zsh-powerline-theme
# install powerline theme
if [ ! -d ${POWERLINE_THEME} ]; then
  git clone git@github.com:jeremyFreeAgent/oh-my-zsh-powerline-theme.git ${POWERLINE_THEME}
  cd ${POWERLINE_THEME}
else
  cd ${POWERLINE_THEME}
  git pull
fi
. ./install_in_omz.sh

printf "install powerline fonts-------------------------\n"
FONTS_PATH=${HOME}/.fonts-powerline
if [ -d ${FONTS_PATH} ] ; then
  cd ${FONTS_PATH}
  git pull
else
  # clone
  git clone https://github.com/powerline/fonts.git --depth=1 ${FONTS_PATH}
  cd ${FONTS_PATH}
fi
# install
./install.sh
# clean-up a bit

CURRENTDATE=`date +"%Y-%m-%d-%H%M"`
for CFG_FILE in ${HOME}/.zshrc ${HOME}/.bash_profile ${HOME}/.profile.local
do
    if [ -L ${CFG_FILE} ]; then
        unlink ${CFG_FILE}
    else
        if [ -f ${CFG_FILE} ]; then
            mv ${CFG_FILE} ${CFG_FILE}.bak.${CURRENTDATE}
        fi
    fi
done

ln -s ${MY_ENV_ROOT}/dotfiles/sh/.profile.local ${HOME}/.profile.local
ln -s ${MY_ENV_ROOT}/dotfiles/sh/.bash_profile ${HOME}/.bash_profile
ln -s ${MY_ENV_ROOT}/dotfiles/sh/.zshrc ${HOME}/.zshrc

SYSOS=`uname -s`
if [ ${SYSOS} = "Darwin" ] ; then
  printf "Addiontal config for Dawrin--------------------------\n"
  printf "iTerm2 users need to set both the Regular font and the Non-ASCII Font in 'iTerm > Preferences > Profiles > Text' to use a patched font.\n"
  printf "Ref: https://github.com/powerline/fonts\n"
fi     #ifend
