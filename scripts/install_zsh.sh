#!/bin/sh
SYSOS=`uname -s`

checkZsh () {
    printf "\nchecking zsh ...\n"
    HAS_ZSH=$(grep zsh /etc/shells | head -n1)
    if [[ ${HAS_ZSH} != '' ]]; then
        printf "$(zsh --version)\n"
        # chsh -s $(which zsh)

    else
        printf "No zsh found: install zsh and oh-my-zsh for more productive.\n"
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
    # sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh) --skip-chsh --unattended --keep-zshrc"

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
}

installPowerline () {
    printf "install powerline fonts ...\n"
    FONTS_PATH=${HOME}/.fonts-powerline
    if [ -d ${FONTS_PATH} ] ; then
        cd ${FONTS_PATH}
        git pull
    else
        git clone https://github.com/powerline/fonts.git --depth=1 ${FONTS_PATH}
        cd ${FONTS_PATH}
    fi
    ./install.sh
}

configBashZsh () {
    # cd ${HOME}
    printf "\nConfuging sh(bash, zsh) profiles ...\n"
    CURRENTDATE=`date +"%Y-%m-%d-%H%M"`
    for CFG_FILE in .xprofile .bash_profile .zprofile .xshrc .bashrc .zshrc .zlogin .bash_logout .zlogout
    do
        if [ -f ${HOME}/${CFG_FILE} ]; then
            mv ${HOME}/${CFG_FILE} ${HOME}/${CFG_FILE}.${CURRENTDATE}
        fi
        curl -fsSL -o ${HOME}/${CFG_FILE} https://raw.githubusercontent.com/izhujiang/my_env/master/dotfiles/sh/${CFG_FILE}
    done


    if [ ${SYSOS} = "Darwin" ] ; then
        printf "Addiontal config for Dawrin ...\n"
        printf "iTerm2 users need to set both the Regular font and the Non-ASCII Font in 'iTerm > Preferences > Profiles > Text' to use a patched font.\n"
        printf "Ref: https://github.com/powerline/fonts\n"
    fi     #ifend
}

installZshEnv () {
    # only install powerline and configZsh when zsh doesn't exist
    checkZsh
    if [[ $HAS_ZSH == '' ]] ; then
        installPowerline
        configBashZsh
        printf "\nIt's better to have zsh installed. Ask your adminstrator for help and 'run install_zsh.sh' again ...\n"
        return 1
    else
        installZshPlugins
        installPowerline
        configBashZsh

        if [[ ! $SHELL =~ "zsh" ]] ; then
            printf "\n"
            while true; do
                read -ep "Do you wish to run chsh for switching into zsh now? Y/[n]" -i "Y" yn
                case $yn in
                    [Yy]* )
                        chsh -s $(grep zsh /etc/shells | head -n1)
                        printf "\nImport!!!\n"
                        printf "Logout(use logout command) and start a new login session for \$SHELL change to take effect. \n"
                        printf "Because chsh command have updated /etc/passwd for current user.\n"
                        break;;
                    [Nn]* )
                        printf "Run \'chsh -s $(grep zsh /etc/shells | head -n1)\' to switch into zsh manually.\n"
                        exit;;
                    * )
                        printf "Please answer yes or no.\n";;
                esac
            done
        fi
    fi
}

installZshEnv
