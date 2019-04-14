#!/bin/bash

ID_RSA_FILE=${HOME}/.ssh/id_rsa.pub
if [ -f "${ID_RSA_FILE}" ]
then
	printf "${ID_RSA_FILE} found.\n"
else
	printf "generate ssh key to access github with git ssh protocol.\n"
	cd ~/
	ssh-keygen -t rsa -b 4096 -C "m.zhujiang@gmail.com"
	eval "$(ssh-agent -s)"
	ssh-add ${HOME}/.ssh/id_rsa
	xclip -sel clip < ~/.ssh/id_rsa.pub

	printf "add public ssh_key to github munually please ...\n"
	# and add ssh_key to github
	# ref: https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/#platform-linux
	# for mac user: https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/#platform-mac

	printf "ref: https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/#platform-linux\n"
	printf "for mac user: https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/#platform-mac\n"

	printf "\nImport!!!\n"
	printf "Ensure adding ssh key to github before continuing...\n"
	read -p "Once have privilege to access to github, Press [Enter] key to continue ...\n"

    # config git global settings.
    git config --global user.name "jiang zhu"
    git config --global user.email "m.zhujiang@gmail.com"
    git config --global color.ui true
    git config --global alias.ignore \
	'!gi() { curl -sL https://www.gitignore.io/api/$@ ;}; gi'
fi

MY_ENV_ROOT=${HOME}/repo/my_env
printf "MY_ENV_ROOT location is:${MY_ENV_ROOT}"
if [ -d ${MY_ENV_ROOT} ];
then
	printf "${MY_ENV_ROOT} existed"
	cd ${MY_ENV_ROOT}
	git pull
else
	printf "${MY_ENV_ROOT} not existed"
	ls -la ${MY_ENV_ROOT}
	# git clone https://github.com/izhujiang/my_env.git
	git clone git@github.com:izhujiang/my_env.git ${MY_ENV_ROOT}
fi
