#!/bin/bash
set -u

ID_RSA_FILE=${HOME}/.ssh/id_rsa.pub
if [ -f "${ID_RSA_FILE}" ]; then
	printf "%s found.\n" "${ID_RSA_FILE}"
else
	printf "generate ssh key to access github with git ssh protocol.\n"
    cd "${HOME}" || return 1
	ssh-keygen -t rsa -b 4096 -C "m.zhujiang@gmail.com"
	eval "$(ssh-agent -s)"
	ssh-add "${HOME}/.ssh/id_rsa"
	# xclip -sel clip < ~/.ssh/id_rsa.pub

	printf "add public ssh_key in %s to the projects in github munually please,\n" "${HOME}/.ssh/id_rsa.pub"
	printf "otherwise just skip it and continue ...\n"
	# and add ssh_key to github
	# ref: https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/#platform-linux
	# for mac user: https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/#platform-mac

	printf "ref: https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/#platform-linux\n"
	printf "for mac user: https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/#platform-mac\n"

	printf "\n\nImport!!!    -------------------- \n"
	printf "Ensure adding ssh key to github's projects you host before continuing...\n"
	read -rp "Once have privilege to access to github, Press [Enter] key to continue ..."

fi
# config git global settings.
# git config --global core.editor vi
# using system $VISUAL variable is better, which maybe nvim or nvr dynamiclly
git config --global user.name "jiang zhu"
git config --global user.email "m.zhujiang@gmail.com"

git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
git config --global color.ui true
git config --global color.ui true
git config --global color.diff-highlight.oldNormal    "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal    "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"
git config --global color.diff.meta       "11"
git config --global color.diff.frag       "magenta bold"
git config --global color.diff.commit     "yellow bold"
git config --global color.diff.old        "red bold"
git config --global color.diff.new        "green bold"
git config --global color.diff.whitespace "red reverse"
git config --bool --global diff-so-fancy.stripLeadingSymbols false
git config --bool --global diff-so-fancy.useUnicodeRuler false

git config --global alias.st status
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.br branch
git config --global alias.ignore \
'!gi() { curl -sL https://www.gitignore.io/api/$@ ;}; gi'
git config --global alias.last 'log -1 HEAD'
git config --global alias.unstage 'reset HEAD --'
git config --global alias.sdiff '!'"git diff && git submodule foreach 'git diff'"
git config --global alias.spush 'push --recurse-submodules=on-demand'
git config --global alias.supdate 'submodule update --remote --merge'

git config --global merge.conflictstyle diff3
git config --global diff.tool vimdiff
git config --global diff.submodule log
git config --global difftool.prompt false

git config --global rerere.enabled true
git config --global credential.helper cache

git config --global pull.rebase true
