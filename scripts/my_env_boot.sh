#!/bin/sh

# installWithBrew is the process to install and config my_env
installWithBrew(){
    # 1. install all libs, packages and tools
    # call:
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/izhujiang/my_env/master/scripts/install_packs.sh)"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/izhujiang/my_env/master/scripts/install_extras.sh)"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/izhujiang/my_env/master/scripts/init_repo.sh)"
    # sh ${MY_ENV_ROOT}/scripts/install_packs.sh
    # sh ${MY_ENV_ROOT}/scripts/init_repo.sh
    # sh ${MY_ENV_ROOT}/scripts/install_extras.sh

    # 2. config git and init my_env repo
    # addtional config for setup my ide
    sh ${MY_ENV_ROOT}/scripts/install_ide.sh
    sh ${MY_ENV_ROOT}/scripts/install_zsh.sh
    # setup my tmux

    # 3. clean up
    printf "Cleaning up-------------------------------------\n"
    brew cleanup

    # 4. That's it. Congratulation
    printf "Congratulation!: Well done. Enjoy your journey!-----\n"
}

MY_ENV_ROOT=${HOME}/repo/my_env
printf "MY_ENV_ROOT: ${MY_ENV_ROOT}\n"
SYSOS=`uname -s`
SYS_DETAIL=`uname -a`

# install specific platform tools and packages according to platform
if [ ${SYSOS} = "Linux" ] ; then
    printf "\nWorking on ${SYSOS}:\n${SYS_DETAIL}\n"
    printf "0. Check prerequuisites before installation...\n"

    BREW_HOME=/home/linuxbrew/.linuxbrew
    if [ ! -d ${BREW_HOME} ]; then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
	eval $(${BREW_HOME}/bin/brew shellenv)
	sudo apt-get install build-essential 
	brew tap caskroom/cask
	brew install gcc
    fi
    export PATH=/home/linuxbrew/.linuxbrew/bin:${PATH}
    installWithBrew

elif [ ${SYSOS} = "Darwin" ] ; then
    # printf "Working on MacOS\n"
    printf "\nWorking on:\n${SYS_DETAIL}\n"

    # 0. check prerequuisites before installation.
    printf "0. Check prerequuisites before installation...\n"
    printf "Todo: Check xcode-select\n"
    # xcode-select --install
    COMMANDLINETOOLS_HOME=/Library/Developer/CommandLineTools
    if [ ! -d ${COMMANDLINETOOLS_HOME} ]; then
	xcode-select --install
    fi

    BREW_HOME=/usr/local/Cellar
    if [ ! -d ${BREW_HOME} ]; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew tap caskroom/cask
    fi
    installWithBrew

else
  printf "${SYSOS} not support now.\n"
  exit
fi



