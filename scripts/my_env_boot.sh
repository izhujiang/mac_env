#!/bin/sh
set -u
# for debug: print command before excute it
# set -x
# enable to exit when errors occur.
# set -euxo pipefail

SYSOS=$(uname -s)

# --------------------------------------------------------------------------
# run as root or sudo user
checkPrerequisitesAndInstallEssentials(){
    # 0. checking prerequuisites before installation.
    printf "0. checking prerequisites before installation ...\n"
    printf "boot up on %s ...\n" "${SYSOS}"

    # checking packages for build programmes, and install it if not available
    checkAndInstallBase || return 1

    installViaHomebrew || return 1

    # temporarily walk around building m1 on ubuntu 20.04
    # if HOMEBREW is not availale

    # if [ "${DISTRO}" = "Ubuntu" ]; then
    #     if [ ! -d "${HOMEBREW}/Homebrew" ]; then
    #         # 1. install all libs, packages and tools
    #         printf "install essential packages ...\n"
    #         sh -c "$(curl -fsSL https://raw.githubusercontent.com/izhujiang/my_env/master/scripts/install_packs_ubuntu.sh)"
    #         # ./install_packs_ubuntu.sh
    #     fi
    # fi
}

installViaHomebrew(){
    #  install homebrew silently
    if [ "${SYSOS}" = "Darwin" ] ; then
        HOMEBREW=/usr/local
        # bash works, not sh
        bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    elif [ "${SYSOS}" = "Linux" ] ; then
        # enable install linuxbrew silently into HOMEBREW
        printf "The prefix /home/linuxbrew/.linuxbrew was chosen so that users without admin access can ask an admin to create a linuxbrew role account and still benefit from precompiled binaries.\n"
        printf "If you do not yourself have admin privileges, consider asking your admin staff to create a linuxbrew role account for you with home directory /home/linuxbrew."
        HOMEBREW=/home/linuxbrew/.linuxbrew
        bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

    else
        printf "HOMEBREW does not support on %s \n." "${SYSOS}"
        return 1
    fi

    export PATH="${HOMEBREW}"/bin:${PATH}
    brew analytics off    # disable Homebrew’s analytics
    brew tap homebrew/cask
    brew tap go-delve/delve
    brew tap mongodb/brew
    # brew tap pivotal/tap
    brew tap golangci/tap
}

# check build-essential/base-devel, git, curl and file in system path, all the prerequisites of brew
checkAndInstallBase(){
    if [ "${SYSOS}" = "Darwin" ] ; then
        printf "boot up on mac ...\n"
        # printf "todo: checking xcode-select\n"
        # xcode-select --install
        COMMANDLINETOOLS_HOME=/Library/Developer/CommandLineTools
        if [ ! -x ${COMMANDLINETOOLS_HOME}/usr/bin/gcc ]; then
            xcode-select --install
        fi

        # printf "todo: checking zsh git curl \n"
        export HOMEBREW=/usr/local
    elif [ "${SYSOS}" = "Linux" ] ; then
        getLinuxDist

        # checking build-essential packages, install it with superuser priviledges if possible
        if [ "${DISTRO}" = "Ubuntu" ]; then
            if [ -x /usr/bin/apt ] || [ -x /bin/apt ]; then
                printf "checking build-essential, git ...\n"
                apt list --installed build-essential | grep build-essential > /dev/null || (printf "installing build-essential ...\n";
                    sudo apt install -y build-essential)|| (printf "\nFailed to install build-essential package ... \n "; return 1)
                apt list --installed git | grep git > /dev/null || (printf "installing git ...\n";
                    sudo apt install -y git)|| (printf "\nFailed to install git. \n "; return 1)
                apt list --installed file | grep file > /dev/null || (printf "installing file ...\n";
                    sudo apt install -y file)|| (printf "\nFailed to install file. \n "; return 1)
                apt list --installed curl | grep curl > /dev/null || (printf "installing curl ...\n";
                    sudo apt install -y curl)|| (printf "\nFailed to install curl. \n "; return 1)
                apt list --installed openssh-server | grep openssh-server > /dev/null || (printf "installing openssh-server ...\n";
                    sudo apt install -y openssh-server)|| (printf "\nFailed to install openssh-server. \n "; return 1)

                apt list --installed zsh | grep zsh > /dev/null || (printf "installing zsh...\n";
                    sudo apt install -y zsh )|| (printf "\nFailed to install zsh. \n "; return 1)
            fi
        elif [ "${DISTRO}" = "Arch" ]; then
            printf "checking base-devel, git ...\n"
            if [ -x /usr/bin/pacman ] || [ -x /bin/pacman ]; then
                pacman -Q -g base-devel | grep base-devel > /dev/null || (printf "installing base-devel ...\n";
                    sudo pacman -S base-devel )|| (printf "\nFailed to install base-devel package ...\n "; return 1)
                pacman -Q git | grep git > /dev/null || (printf "installing git ...\n"; sudo pacman -S git )|| (printf "\nFailed to install git. \n "; return 1)
                pacman -Q curl | grep curl > /dev/null || (printf "installing curl ...\n"; sudo pacman -S curl )|| (printf "\nFailed to install curl. \n "; return 1)
                pacman -Q file | grep file > /dve/null || (printf "installing file ...\n"; sudo pacman -S file) || (printf "\nFailed to install file. \n "; return 1)
                pacman -Q openssh-server | grep openssh-server > /dev/null || (printf "installing openssh-server ...\n"; sudo pacman -S openssh-server) || (printf "\nFailed to install openssh-server. \n "; return 1)
                pacman -Q zsh | grep zsh > /dve/null || (printf "installing zsh ...\n"; sudo pacman -S zsh ) || (printf "\nFailed to install zsh. \n "; return 1)
            fi
        else
            printf "plz install the essential packages, including git,  manually on %s for building and compiling program\n. Run the script again after that.\n" "${DISTRO}"
            return 1
        fi
    else
        printf "not support %s now.\n" "${SYSOS}"
        return 1
    fi

}

# --------------------------------------------------------------------------
# run as non-root or non-sudoer
setupNonAdminEnv(){
    if [ -d "${HOMEBREW}/Homebrew" ]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/izhujiang/my_env/master/scripts/install_packs.sh)"
    fi
    printf "install extras packages ...\n"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/izhujiang/my_env/master/scripts/install_extras.sh)"
    # ./install_extras.sh

    # 2. config git and init my_env repo
    printf "setup and config git ...\n"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/izhujiang/my_env/master/scripts/install_github.sh)"

    # addtional config for setup my ide
    printf "setup tmux ...\n"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/izhujiang/my_env/master/scripts/install_tmux.sh)"

    printf "setup IDE ...\n"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/izhujiang/my_env/master/scripts/install_ide.sh)"
    # ./install_ide.sh
}

# optional
setupZsh(){
    # printf "install zsh plugins ...\n"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/izhujiang/my_env/master/scripts/install_zsh.sh)" || return 1
}

postInstall(){
    # Output environment viriables used by shell profile
    {
        printf "# ===================================================================================\n";
        printf "# .evn file was generated by my_env_boot.sh automatically, plz don't modify manually.\n";
        printf "# ===================================================================================\n";

        PY_PACKS_LOC=$(pip3 show powerline-status | grep Location);
        PY_PACKS_LOC=${PY_PACKS_LOC##*Location: };
        printf "export PY_PACKS_LOC=%s\n" "${PY_PACKS_LOC}";
        [ -d "${HOMEBREW}" ] &&  printf "export HOMEBREW=%s\n" "${HOMEBREW}";
        [ -x "${HOMEBREW}/bin/brew" ] && ${HOMEBREW}/bin/brew shellenv;
    } > "${HOME}/.env"

    # 3. clean up
    # walk around zfz installer has no "\n"
    printf "\nCleaning up-------------------------------------\n"
    [ -x "${HOMEBREW}/bin/brew" ] && "${HOMEBREW}"/bin/brew cleanup

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

    echo $PM
}

bootup(){
    checkPrerequisitesAndInstallEssentials || return 1

    setupNonAdminEnv
    postInstall

    # optional: install ohmyzsh when zsh exists
    setupZsh

    exit 0
}
# entry of main script
# checkPrerequisites
bootup
