#!/bin/sh

# installWithBrew is the process to install and config my_env
installWithBrew(){
    # 1. install all libs, packages and tools
    # call:
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/izhujiang/my_env/master/scripts/init_repo.sh)"
    # sh ${MY_ENV_ROOT}/scripts/init_repo.sh

    # 2. config git and init my_env repo
    # addtional config for setup my ide
    sh ${MY_ENV_ROOT}/scripts/install_zsh.sh
    sh ${MY_ENV_ROOT}/scripts/install_ide.sh
    # setup my tmux


    # 3. That's it. Congratulation
    printf "Congratulation!: Well done. Enjoy your journey!-----\n"
}

MY_ENV_ROOT=${HOME}/repo/my_env
printf "MY_ENV_ROOT: ${MY_ENV_ROOT}\n"

SYS_DETAIL=`uname -a` 
printf "\nWorking on:\n${SYS_DETAIL}\n"

# 0. check prerequuisites before installation.
printf "0. Check prerequuisites and necessary packages before installing customed environment...\n"

installWithBrew

