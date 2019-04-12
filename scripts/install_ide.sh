#!/bin/sh

# install vim and nvim plugins
printf "Config my dev env......\n"
printf "Install plugins for vim/nvim......\n"

MY_ENV_ROOT=${HOME}/repo/my_env
CURRENTDATE=`date +"%Y-%m-%d-%H%M"`
for CFG_FILE in ${HOME}/.vimrc ${HOME}/.config/nvim/init.vim
do
    if [ -L ${CFG_FILE} ]; then
        unlink ${CFG_FILE}
    else
        if [ -f ${CFG_FILE} ]; then
            mv ${CFG_FILE} ${CFG_FILE}.bak.${CURRENTDATE}
        fi
    fi
done
ln -s ${MY_ENV_ROOT}/dotfiles/vim/.vimrc_readonly ${HOME}/.vimrc
NVIM_CFG_DIR=${HOME}/.config/nvim
if [ ! -d ${NVIM_CFG_DIR} ]; then
	mkdir -p ${NVIM_CFG_DIR}
fi
ln -s ${MY_ENV_ROOT}/dotfiles/vim/init_nvim_readonly ${NVIM_CFG_DIR}/init.vim

vim +PlugInstall +qall
nvim +PlugInstall +qall

sleep 2
unlink ${HOME}/.vimrc
unlink ${HOME}/.config/nvim/init.vim
ln -s ${MY_ENV_ROOT}/dotfiles/vim/.vimrc ${HOME}/.vimrc
ln -s ${MY_ENV_ROOT}/dotfiles/vim/init.vim ${HOME}/.config/nvim/init.vim
