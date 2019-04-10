#!/bin/bash


CUR_SHELL=$(echo $SHELL)
# echo ${CUR_SHELL}
ZSH="zsh"
if [[ ${CUR_SHELL} == *${ZSH}* ]]
then
        echo "zsh has been installed and set as default shell."
else
        echo "zsh has not been installed or set as default shell, so it will install zsh and oh-my-zsh first..."
        sudo apt install -y zsh git xclip
        rm -rf ~/.oh-my-zsh
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed 's:env zsh -l::g' | sed 's:chsh -s .*$::g' | sed '/chsh -s/d' )"
        chsh -s $(which zsh)

        echo ""
        echo "zsh and oh-my-zsh has been installed and set as default shell, now quit gnome session automatically, please run the boot script again after re-login."
        read -p "Press any key to continue ..."
        gnome-session-quit
fi

ID_RSA_FILE=~/.ssh/id_rsa.pub
if [ -f "${ID_RSA_FILE}" ]
then
	echo "${ID_RSA_FILE} found."
else
	echo "generate ssh key to access github with git ssh protocol"
	cd ~/
	ssh-keygen -t rsa -b 4096 -C "m.zhujiang@gmail.com"
	eval "$(ssh-agent -s)"
	ssh-add ~/.ssh/id_rsa
	xclip -sel clip < ~/.ssh/id_rsa.pub

	echo "add public ssh_key to github munually please ..."

	echo ""
	echo "Import!!!"
	echo "Ensure adding ssh key to github before continuing..."
	read -p "Once have privilege to access to github, Press [Enter] key to continue ..."
fi

REPO_DIR=~/repo/my_env
if [ -d ${REPO_DIR} ]
then
	echo "${REPO_DIR} existed"
	cd ${REPO_DIR}
	git pull
else
	mkdir -p ~/repo
	cd ~/repo
	# git clone https://github.com/izhujiang/my_env.git
	git clone git@github.com:izhujiang/my_env.git
	cd my_env
fi

export MY_ENV_ROOT=$(cd "$(dirname '$0')";  pwd)
echo "MY_ENV_ROOT location is:${MY_ENV_ROOT}"

echo "install packages ...."
# source ${MY_ENV_ROOT}/platforms/linux/install_packages_ubuntu


for CFG_FILE in ${HOME}/.zshrc ${HOME}/.bash_profile
do
    if [ -L ${CFG_FILE} ]; then
        unlink ${CFG_FILE}
    else
        if [ -f ${CFG_FILE} ]; then
            rm ${CFG_FILE}
        fi
    fi
done

ln -s ${MY_ENV_ROOT}/dotfiles/sh/.bash_profile ~/.bash_profile
ln -s ${MY_ENV_ROOT}/dotfiles/sh/.zshrc ~/.zshrc

