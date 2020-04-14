#!/bin/sh
SYSOS=`uname -s`

checkZsh(){
    printf "\nchecking zsh ...\n"
    if [[ -x /bin/zsh || -x /usr/bin/zsh ]]; then
        printf "$(zsh --version)\n"
        # chsh -s $(which zsh)

    else
        printf "No zsh found /bin/zsh or /usr/bin/zsh. Install zsh and oh-my-zsh for more productive.\n"
        printf "Otherwise, just skip it and use bash if have no sudo privilege.\n"

        # todo: install zsh if have sudo privilege
            # grep -q "$(which zsh)" /etc/shells || sudo -s "echo $(which zsh) >> /etc/shells" && chsh -s $(which zsh)
            # grep -q "$(which zsh)" /etc/shells || sudo -s "echo $(which zsh) >> /etc/shells"
        return 1
    fi
}

installZshPlugins(){
    # assumming zsh exists in /etc/shells, install ohmyzsh and powerline as well as its custom plugins
    printf "install oh-my-zsh, powerline and other plugins for zsh ...\n"

    # install zsh plugins
    printf "installing plugins for zsh\n"
    export ZSH=${HOME}/.oh-my-zsh
    export ZSH_CUSTOM=${ZSH}/custom

    rm -rf ${ZSH}
    # sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed 's:env zsh -l::g' | sed 's:chsh -s .*$::g' | sed '/chsh -s/d' )"
    # todo: install oh-my-zsh silently, and continue the rest part
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

    printf "\nInstall plugins for oh-my-zsh ...\n"
    # printf "\nZSH_CUSTOM: ${ZSH_CUSTOM} ...\n"
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

    printf "todo: add forgit https://github.com/wfxr/forgit\n"

    printf "install oh-my-zsh-powerline-theme status ...\n"
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
        git clone https://github.com/powerline/fonts.git --depth=1 ${FONTS_PATH}
        cd ${FONTS_PATH}
    fi
    ./install.sh

    # cd ${HOME}
    CURRENTDATE=`date +"%Y-%m-%d-%H%M"`
    for CFG_FILE in .xprofile .bash_profile .zprofile .xshrc .bashrc .zshrc .zlogin .bash_logout .zlogout
    do
        if [ -f ${HOME}/${CFG_FILE} ]; then
            mv ${HOME}/${CFG_FILE} ${HOME}/${CFG_FILE}.${CURRENTDATE}
        fi
        curl -fsSL -o ${HOME}/${CFG_FILE} https://raw.githubusercontent.com/izhujiang/my_env/master/dotfiles/sh/${CFG_FILE}
    done

    # for CFG_FILE in .zprofile .zshenv
    # do
    #     if [ -e ${HOME}/${CFG_FILE} ]; then
    #         unlink ${HOME}/${CFG_FILE}
    #     fi
    # done
    # ln -s ${HOME}/.profile ${HOME}/.zprofile
    # ln -s ${HOME}/.env ${HOME}/.zshenv


    # mkdir ${HOME}/.zsh
    # MY_ENV_ROOT=${HOME}/repo/my_env
    # zplug is slower than oh-my-zsh built-in plugins manager
    # ln -s ${MY_ENV_ROOT}/dotfiles/sh/.zplug ${HOME}/.zplug
    # ln -s ${MY_ENV_ROOT}/dotfiles/sh/.profile.local ${HOME}/.profile.local
    # ln -s ${MY_ENV_ROOT}/dotfiles/sh/.bash_profile ${HOME}/.bash_profile
    # ln -s ${MY_ENV_ROOT}/dotfiles/sh/.zshrc ${HOME}/.zshrc

    if [ ${SYSOS} = "Darwin" ] ; then
    printf "Addiontal config for Dawrin--------------------------\n"
    printf "iTerm2 users need to set both the Regular font and the Non-ASCII Font in 'iTerm > Preferences > Profiles > Text' to use a patched font.\n"
    printf "Ref: https://github.com/powerline/fonts\n"
    fi     #ifend

}

installZshEnv(){
    if [[ $SHELL == "*zsh" ]] ; then
        installZshPlugins
    else
        checkZsh || return 1

        installZshPlugins
        chsh -s $(grep zsh /etc/shells | head -n1)
        printf "\n--------------------------------------------------------\n"
        printf "Logout(use logout command) and start a new login session for a change(\$SHELL) to take effect. Because chsh command have updated /etc/passwd for current user.\n"
    fi
}

installZshEnv
