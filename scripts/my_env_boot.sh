#!/bin/sh

checkPrerequisites(){
    SYSOS=`uname -s`
    printf "boot up on %s ...\n" $SYSOS
    printf "0. checking prerequisites before installation ...\n"

    # checking packages for build programmes, and install it if not available
    checkAndInstallEssentialPackages || return 1

    # checking git, and install it if not available
    # checkAndInstallGit || return 1

    installHomebrew || return 1
}

installHomebrew(){
    # todo: install homebrew silently
    if [ ${SYSOS} = "Linux" ] ; then
        # todo: enable install linuxbrew silently into HOMEBREW
        HOMEBREW=${HOME}/.linuxbrew

        # install by git clnoe
        # if [ ! -d ${HOMEBREW} ]; then
        #     git clone https://github.com/Homebrew/brew ${HOMEBREW}/Homebrew
        #     mkdir ${HOMEBREW}/bin
        #     ln -s ${HOMEBREW}/Homebrew/bin/brew ${HOMEBREW}/bin
        #     eval $(\${HOMEBREW}/bin/brew shellenv)
        # fi
    elif [ ${SYSOS} = "Darwin" ] ; then
        HOMEBREW=/usr/local
    else
        printf "HOMEBREW does not support on ${SYSOS}.\n"
        return 1
    fi

    if [ ! -d ${HOMEBREW} ]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
        brew analytics off    # disable Homebrew’s analytics
        brew tap homebrew/cask
        brew tap go-delve/delve
        brew tap mongodb/brew
        brew tap pivotal/tap
        brew tap golangci/tap
        export PATH=${HOMEBREW}/bin:${PATH}
    fi
}

# check build-essential/base-devel, git, curl and file in system path, all the prerequisites of brew
checkAndInstallEssentialPackages(){
    if [ ${SYSOS} = "Linux" ] ; then
        getLinuxDist

        # todo: enable install linuxbrew silently into HOMEBREW
        HOMEBREW=${HOME}/.linuxbrew
        # todo: checking build-essential packages, install it with superuser priviledges if possible
        if [ $DISTRO = "Ubuntu" ]; then
            if [[ -x /usr/bin/apt || -x /bin/apt ]]; then
                printf "checking build-essential, git ...\n"
                apt list --installed build-essential | grep build-essential > /dev/null || (printf "installing build-essential ...\n";
                    sudo apt install build-essential)|| (printf "\nFailed to install build-essential package ... \n "; return 1)
                apt list --installed git | grep git > /dev/null || (printf "installing git ...\n";
                    sudo apt install git)|| (printf "\nFailed to install git. \n "; return 1)
                # apt list --installed file | grep file || (printf "installing file ...\n";
                    # sudo apt install file)|| (printf "\nFailed to install file. \n "; return 1)
                # apt list --installed curl | grep curl || (printf "installing curl ...\n";,
                    # sudo apt install curl)|| (printf "\nFailed to install curl. \n "; return 1)
            fi
        elif [ $DISTRO = "Arch" ]; then
            printf "checking base-devel, git ...\n"
            if [[ -x /usr/bin/pacman || -x /bin/pacman ]]; then
                pacman -Q -g base-devel | grep base-devel > /dev/null || (printf "installing base-devel ...\n";
                    sudo pacman -S base-devel )|| (printf "\nFailed to install base-devel package ...\n "; return 1)
                pacman -Q git | grep git > /dev/null || (printf "installing git ...\n"; sudo pacman -S git )|| (printf "\nFailed to install git. \n "; return 1)
                # pacman -Q curl || (printf "installing curl ...\n"; sudo pacman -S curl )|| (printf "\nFailed to install curl. \n "; return 1)
                # pacman -Q file || (printf "installing file ...\n"; sudo pacman -S file) || (printf "\nFailed to install file. \n "; return 1)
            fi
        else
            printf "plz install the essential packages, including git,  manually on %s for building and compiling program\n. Run the script again after that.\n" $DISTRO
            return 1
        fi

    elif [ ${SYSOS} = "Darwin" ] ; then
        printf "boot up on mac ...\n"
        printf "todo: checking xcode-select\n"
        # xcode-select --install
        COMMANDLINETOOLS_HOME=/Library/Developer/CommandLineTools
        if [ ! -x ${COMMANDLINETOOLS_HOME}/usr/bin/gcc ]; then
            xcode-select --install
        fi

        export HOMEBREW=/usr/local
    else
        printf "${SYSOS} not support now.\n"
        return 1
    fi

}

# checkAndInstallGit(){
#     printf "\nchecking git ...\n"
#     # if [ ${SYSOS} = "Linux" ] ; then
#     #     if [ ${DISTRO} = "Ubuntu" ] ; then
#     #         if [[ -x /usr/bin/apt || -x /bin/apt ]]; then
#     #             apt list --installed git | grep git && return 0
#     #         fi
#     #     elif [ ${DISTRO} = "Arch" ] ; then
#     #         if [[ -x /usr/bin/pacman || -x /bin/pacman ]]; then
#     #             pacman -Q git | grep git && return 0
#     #         fi

#     #     else
#     #         printf "plz install git manually on %s \n" $DISTRO
#     #         return 1
#     #     fi

#     # elif [ ${SYSOS} = "Darwin" ] ; then
#     #     printf "\n"
#     # else
#     #     return 1
#     # fi
#     command -v git | grep git && return 0

#     printf "No system git exists. \n installing git ...\n";
#     # cann't install homebrew using homebrew's installation script without git in system path
#     # /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

#     # install temporary git
#     printf "download form https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.9.5.tar.gz, build and instll it\n"
#     GIT_TMP="/tmp/git"
#     mkdir -p $GIT_TMP
#     curl https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.9.5.tar.gz | tar -zx  -C $GIT_TMP
#     cd ${GIT_TMP}/git-2.9.5
#     ./configure --prefix=$GIT_TMP
#     make && make install
#     cd ~/
#     export PATH=${PATH}:${GIT_TMP}/bin
# }

install(){
    # 1. install all libs, packages and tools
    # call:
    printf "install essential packages ...\n"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/izhujiang/my_env/master/scripts/install_packs.sh)"
    printf "install extras packages ...\n"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/izhujiang/my_env/master/scripts/install_extras.sh)"
    printf "todo: install and config git ...\n"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/izhujiang/my_env/master/scripts/install_github.sh)"

    # sh ${MY_ENV_ROOT}/scripts/install_packs.sh
    # sh ${MY_ENV_ROOT}/scripts/install_repo.sh
    # sh ${MY_ENV_ROOT}/scripts/install_extras.sh

    printf "install zsh plugins ...\n"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/izhujiang/my_env/master/scripts/install_zsh.sh)"
    # 2. config git and init my_env repo
    # addtional config for setup my ide
    # printf "conifg tmux ...\n"
    # sh ${MY_ENV_ROOT}/scripts/install_tmux.sh
    # printf "conifg IDE ...\n"
    # sh ${MY_ENV_ROOT}/scripts/install_ide.sh
}

installZsh(){
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/izhujiang/my_env/master/scripts/install_zsh.sh)" || return 1
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
    # printf "export PATH=\${HOMEBREW}/bin:\${HOMEBREW}/sbin:\${PATH}\n" >> ${HOME}/.env
    # printf "export MANPATH=\${HOMEBREW}/share/man:\${MANPATH}\n" >> ${HOME}/.env
    # printf "export INFOPATH=\${HOMEBREW}/share/info:\${INFOPATH}\n" >> ${HOME}/.env

    printf "export MY_ENV_ROOT=\${HOME}/repo/my_env\n" >> ${HOME}/.env
    printf "export XML_CATALOG_FILES=\${HOMEBREW}/etc/xml/catalog\n" >> ${HOME}/.env
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

    # 3. clean up
    printf "Cleaning up-------------------------------------\n"
    brew cleanup

    # 4. That's it. Congratulation
    printf "Congratulation!: Well done. Enjoy your journey!-----\n"
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

bootup(){
    # 0. checking prerequuisites before installation.
    checkPrerequisites
    if [ $? != 0 ]; then
        return 1
    fi

    initEnv
    install
    postInstall

    # install ohmyzsh when zsh exists
    installZsh
    exit 0
}
# entry of main script
bootup

# checkPrerequisites
