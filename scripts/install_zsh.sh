#!/bin/sh
SYSOS=`uname -s`

# install zsh, ohmyzsh and powerline as well as its custom plugins
printf "install oh-my-zsh, powerline and other plugins for zsh ...... \n"

# install zsh plugins
printf "installing plugins for zsh\n"
export ZSH=${HOME}/.oh-my-zsh
export ZSH_CUSTOM=${ZSH}/custom
MY_ENV_ROOT=${HOME}/repo/my_env

rm -rf ${ZSH}
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed 's:env zsh -l::g' | sed 's:chsh -s .*$::g' | sed '/chsh -s/d' )"
chsh -s $(which zsh)

# todo: only print out in case of ubuntu
printf "zsh and oh-my-zsh has been installed and set as default shell, now quit gnome session automatically, \nplease run the boot script again after re-login.\n\n"
printf "ZSH_CUSTOM: ${ZSH_CUSTOM} ......\n"

# manage zsh_plugins with zplug instead.
for plugin in zsh-autosuggestions zsh-syntax-highlighting zsh-completions
do
  if [ ! -d ${ZSH_CUSTOM}/plugins/${plugin} ]; then
    # git clone git://github.com/zsh-users/${plugin} ${ZSH_CUSTOM}/plugins/${plugin}
    git clone https://github.com/zsh-users/${plugin}.git ${ZSH_CUSTOM}/plugins/${plugin}
  else
    cd ${ZSH_CUSTOM}/plugins/${plugin}
    git pull
  fi
done


# printf "install buffalo plugin ..."
# BUFFALO=${HOME}/.oh-my-zsh/custom/plugins/buffalo
# if [ ! -d ${BUFFALO} ]; then
#     git clone https://github.com/1995parham/buffalo.zsh ~/.oh-my-zsh/custom/plugins/buffalo
#   cd ${BUFFALO}
# else
#   cd ${BUFFALO}
#   git pull
# fi

printf "install oh-my-zsh-powerline-theme status......\n"
POWERLINE_THEME=${HOME}/.oh-my-zsh-powerline-theme
# install powerline theme
if [ ! -d ${POWERLINE_THEME} ]; then
  # git clone git@github.com:jeremyFreeAgent/oh-my-zsh-powerline-theme.git ${POWERLINE_THEME}
  git clone https://github.com/jeremyFreeAgent/oh-my-zsh-powerline-theme.git ${POWERLINE_THEME}
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
for CFG_FILE in ${HOME}/.zshrc ${HOME}/.bash_profile ${HOME}/.profile.local ${HOME}/.zplug
do
    if [ -L ${CFG_FILE} ]; then
        unlink ${CFG_FILE}
    else
        if [ -f ${CFG_FILE} ]; then
            mv ${CFG_FILE} ${CFG_FILE}.bak.${CURRENTDATE}
        fi
    fi
done

mkdir ${HOME}/.zsh
# zplug is slower than oh-my-zsh built-in plugins manager
# ln -s ${MY_ENV_ROOT}/dotfiles/sh/.zplug ${HOME}/.zplug
ln -s ${MY_ENV_ROOT}/dotfiles/sh/.profile.local ${HOME}/.profile.local
ln -s ${MY_ENV_ROOT}/dotfiles/sh/.bash_profile ${HOME}/.bash_profile
ln -s ${MY_ENV_ROOT}/dotfiles/sh/.zshrc ${HOME}/.zshrc

if [ ${SYSOS} = "Darwin" ] ; then
  printf "Addiontal config for Dawrin--------------------------\n"
  printf "iTerm2 users need to set both the Regular font and the Non-ASCII Font in 'iTerm > Preferences > Profiles > Text' to use a patched font.\n"
  printf "Ref: https://github.com/powerline/fonts\n"
fi     #ifend
