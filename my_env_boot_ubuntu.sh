#!/bin/bash

sudo apt update && sudo apt upgrade

sudo apt install -y curl wget

TEST_CURRENT_SHELL=$(basename "$SHELL")
# echo ${CUR_SHELL}
if [ "$TEST_CURRENT_SHELL" != "zsh" ]; then
        echo "zsh has not been installed or set as default shell, so it will install zsh and oh-my-zsh first..."
        sudo apt install -y zsh git xclip
        rm -rf ~/.oh-my-zsh
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed 's:env zsh -l::g' | sed 's:chsh -s .*$::g' | sed '/chsh -s/d' )"
        chsh -s $(which zsh)

        echo ""
        echo "zsh and oh-my-zsh has been installed and set as default shell, now quit gnome session automatically, please run the boot script again after re-login."
        read -p "Press any key to continue ..."
        gnome-session-quit
else
        echo "zsh has been installed and set as default shell."
fi

# config git global settings.
git config --global user.name "jiang zhu"
git config --global user.email "m.zhujiang@gmail.com"
git config --global color.ui true

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
	# and add ssh_key to github
	# ref: https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/#platform-linux
	# for mac user: https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/#platform-mac

	echo "ref: https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/#platform-linux"
	echo "for mac user: https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/#platform-mac"

	echo ""
	echo "Import!!!"
	echo "Ensure adding ssh key to github before continuing..."
	read -p "Once have privilege to access to github, Press [Enter] key to continue ..."
fi

export MY_ENV_ROOT=${HOME}/repo/my_env
echo "MY_ENV_ROOT location is:${MY_ENV_ROOT}"
if [ -d ${MY_ENV_ROOT} ];
then
	echo "${MY_ENV_ROOT} existed"
	cd ${MY_ENV_ROOT}
	git pull
else
	echo "${MY_ENV_ROOT} not existed"
	ls -la ${MY_ENV_ROOT}
	mkdir -p ~/repo
	cd ~/repo
	# git clone https://github.com/izhujiang/my_env.git
	git clone git@github.com:izhujiang/my_env.git
	cd my_env
fi

echo "-----------------------------------------"
echo " source ${MY_ENV_ROOT}/platforms/linux/install_packages_ubuntu"
. ${MY_ENV_ROOT}/platforms/linux/install_packages_ubuntu


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

echo "clean up useless packages..."
sudo apt autoremove -y
