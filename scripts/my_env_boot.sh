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
    sh ${MY_ENV_ROOT}/scripts/install_zsh.sh
    sh ${MY_ENV_ROOT}/scripts/install_tmux.sh
    sh ${MY_ENV_ROOT}/scripts/install_ide.sh

    # 3. clean up
    printf "Cleaning up-------------------------------------\n"
    brew cleanup

    # 4. That's it. Congratulation
    printf "Congratulation!: Well done. Enjoy your journey!-----\n"
}

initEnv(){
    # todo: fetch current path of my_env_boot.sh
    export MY_ENV_ROOT=${HOME}/repo/my_env
    # printf "MY_ENV_ROOT: ${MY_ENV_ROOT}\n"

    printf "# ===================================================================================\n" > ${HOME}/.env
    printf "# .evn file was generated by my_env_boot.sh automatically, plz don't modify manually\n" >> ${HOME}/.env
    printf "# ===================================================================================\n" >> ${HOME}/.env

    printf "export LANG=en_US.UTF-8\n" >> ${HOME}/.env
    printf "export LC_ALL=en_US.UTF-8\n" >> ${HOME}/.env
    printf "unset LC_CTYPE\n" >> ${HOME}/.env
    printf "export SSH_KEY_PATH=\${HOME}/.ssh/rsa_id\n" >> ${HOME}/.env
    printf "export HOMEBREW=%s\n" ${HOMEBREW} >> ${HOME}/.env
    printf "export HOMEBREW_PREFIX=\${HOMEBREW}\n" >> ${HOME}/.env
    printf "export HOMEBREW_CELLAR=\${HOMEBREW_CELLAR}\n" >> ${HOME}/.env
    printf "export HOMEBREW_REPOSITORY=\${HOMEBREW_REPOSITORY}\n" >> ${HOME}/.env
    printf "export PATH=\${HOMEBREW}/bin:\${HOMEBREW}/sbin:\${PATH}\n" >> ${HOME}/.env
    printf "export MANPATH=\${HOMEBREW}/share/man:\${MANPATH}\n" >> ${HOME}/.env
    printf "export INFOPATH=\${HOMEBREW}/share/info:\${INFOPATH}\n" >> ${HOME}/.env

    printf "export MY_ENV_ROOT=%s\n" ${MY_ENV_ROOT} >> ${HOME}/.env

}

postInstall(){
    PY_PACKS_LOC=$(pip3 show powerline-status | grep Location)
    # PY_PACKS_LOC=$(pip show powerline-status | grep Location)
    PY_PACKS_LOC=${PY_PACKS_LOC##*Location: }

    # if [ "$PY_PACKS_LOC" = "" ]; then
    #     export POWERLINE_ZSH=""
    #     echo "powerline-status does not exist, install it with pip3 install powerline-status"
    # else
    #     export POWERLINE_ZSH=${PY_PACKS_LOC}/powerline/bindings/zsh/powerline.zsh
    #     # echo '/usr/local/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh'
    #     # echo ${POWERLINE_ZSH}
    #     # source ${POWERLINE_ZSH}
    # fi

    # echo ${PY_PACKS_LOC}
    printf "export PY_PACKS_LOC=%s\n" ${PY_PACKS_LOC} >> ${HOME}/.env
}

bootupOnMac(){
    # printf "Working on MacOS\n"
    printf "\nWorking on:\n${SYS_DETAIL}\n"
    initEnv

    # 0. check prerequuisites before installation.
    printf "0. Check prerequuisites before installation...\n"
    printf "Todo: Check xcode-select\n"
    # xcode-select --install
    COMMANDLINETOOLS_HOME=/Library/Developer/CommandLineTools
    if [ ! -d ${COMMANDLINETOOLS_HOME} ]; then
        xcode-select --install
    fi

    if [ ! -d ${HOMEBREW} ]; then
        # /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
        # brew tap caskroom/cask
        brew tap homebrew/cask-cask

    fi
    installWithBrew

    postInstall
}

bootupOnLinux(){
    printf "\nWorking on ${SYSOS}:\n${SYS_DETAIL}\n"
    printf "0. Check prerequuisites before installation...\n"

    getLinuxDist
    printf "Running on %s ...\n " $DISTRO
    # if [ $DISTRO = "Arch" ]; then
    #     # printf "Install essential packages with command: sudo pacman -S base-dev\n"
    # elif [ $DISTRO = "Ubuntu" ]; then
    #     # printf "Install essential packages with command: sudo apt install build-essential\n"
    # else
    #     printf "Running on %s..." $DISTRO
    # fi

    initEnv
    if [ ! -d ${HOMEBREW} ]; then
        # sudo apt-get install build-essential

        # sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
        eval $(${HOMEBREW}/bin/brew shellenv)
        # brew tap caskroom/cask
        brew tap homebrew/cask-cask
    fi
    export PATH=${HOMEBREW}/bin:${PATH}
    installWithBrew

    postInstall
}

getLinuxDist()
{
    if grep -Eq "CentOS" /etc/issue || grep -Eq "CentOS" /etc/*-release; then
        DISTRO='CentOS'
        PM='yum'
    elif grep -Eq "Red Hat Enterprise Linux Server" /etc/issue || grep -Eq "Red Hat Enterprise Linux Server" /etc/*-release; then
        DISTRO='RHEL'
        PM='yum'
    elif grep -Eq "Fedora" /etc/issue || grep -Eq "Fedora" /etc/*-release; then
        DISTRO='Fedora'
        PM='yum'
    elif grep -Eq "Debian" /etc/issue || grep -Eq "Debian" /etc/*-release; then
        DISTRO='Debian'
        PM='apt'
    elif grep -Eq "Ubuntu" /etc/issue || grep -Eq "Ubuntu" /etc/*-release; then
        DISTRO='Ubuntu'
        PM='apt'
    elif grep -Eq "Raspbian" /etc/issue || grep -Eq "Raspbian" /etc/*-release; then
        DISTRO='Raspbian'
        PM='apt'
    elif grep -Eq "Arch" /etc/issue || grep -Eq "Arch" /etc/*-release; then
        DISTRO='Arch'
        PM='pacman'
    else
        DISTRO='unknow'
    fi
}
# entry of main script
export SYSOS=`uname -s`
SYS_DETAIL=`uname -a`
# install specific platform tools and packages according to platform
if [ ${SYSOS} = "Linux" ] ; then
    export HOMEBREW=${HOME}/.linuxbrew
    echo "boot up on linux"
    bootupOnLinux
elif [ ${SYSOS} = "Darwin" ] ; then
    export HOMEBREW=/usr/local
    echo "boot up on mac"
    # initEnv  // for test
    bootupOnMac
    # postInstall  // for test
else
  printf "${SYSOS} not support now.\n"
  exit
fi
