#!/bin/sh


MY_ENV_ROOT=${HOME}/repo/my_env

SYSOS=`uname -s`
# install specific platform tools and packages according to platform
if [ ${SYSOS} = "Linux" ] ; then
    printf "Working on Linux: ${SYSOS},only support ubuntu now. \n"
    # 1. install all libs, packages and tools
    # call:
    # sh -c "$(curl -fsSL https://raw.githubusercontent.com/izhujiang/my_env/master/script/install_packs_ubuntu.sh)"
    # sh -c "$(curl -fsSL https://raw.githubusercontent.com/izhujiang/my_env/master/script/install_extras.sh)"
    sh ./install_packs_ubuntu.sh
    sh ./init_repo.sh
    sh ./install_extras.sh

    # 2. config git and init my_env repo
    # addtional config for setup my ide
    sh ./install_ide.sh
    sh ./install_zsh.sh
    # setup my tmux
    sudo apt autoremove -y

elif [ ${SYSOS} = "Darwin" ] ; then
    # printf "Working on MacOS\n"
    SYS_DETAIL=`uname -a`
    printf "Working on:\n${SYS_DETAIL}\n"

    # 0. check prerequuisites before installation.
    printf "--------------------------------------------\n"
    printf "0. Check prerequuisites before installation.\n"
    printf "Todo: Check xcode-select"
    # xcode-select --install

    # 1. install all libs, packages and tools
    # call:
    # sh -c "$(curl -fsSL https://raw.githubusercontent.com/izhujiang/my_env/master/script/install_packs_mac.sh)"
    # sh -c "$(curl -fsSL https://raw.githubusercontent.com/izhujiang/my_env/master/script/install_extras.sh)"
    sh ./install_packs_mac.sh
    sh ./init_repo.sh
    sh ./install_extras.sh

    # 2. config git and init my_env repo
    # addtional config for setup my ide
    sh ./install_ide.sh
    sh ./install_zsh.sh
    # setup my tmux

    # 3. clean up
    printf "Cleaning up-------------------------------------\n"
    brew cleanup

    # 4. That's it. Congratulation
    printf "Congratulation!: Well done. Enjoy your journey!-----\n"
else
  printf "${SYSOS} not support now.\n"
fi
