#!/bin/sh

# install vim and nvim plugins
printf "Config my dev env......\n"
printf "Install plugins for vim/nvim......\n"

MY_ENV_ROOT=${HOME}/repo/my_env
CURRENTDATE=`date +"%Y-%m-%d-%H%M"`
for CFG_FILE in ${HOME}/.vimrc ${HOME}/.config/nvim/init.vim ${HOME}/.editorconfig ${HOME}/.eslintrc.js
do
    if [ -L ${CFG_FILE} ]; then
        unlink ${CFG_FILE}
    else
        if [ -f ${CFG_FILE} ]; then
            mv ${CFG_FILE} ${CFG_FILE}.bak.${CURRENTDATE}
        fi
    fi
done

NVIM_CFG_DIR=${HOME}/.config/nvim
if [ ! -d ${NVIM_CFG_DIR} ]; then
	mkdir -p ${NVIM_CFG_DIR}
fi

printf "vim-go check GOPATH: ${GOPATH}\n"
export GOPATH=${HOME}/workspace/go
printf "install plugins for vim...\n"
vim +PlugInstall +qall
printf "install plugins for nvim...\n"
nvim +PlugInstall +qall

sleep 2

ln -s ${MY_ENV_ROOT}/dotfiles/vim/vi_cfg.vim ${HOME}/.vimrc
ln -s ${MY_ENV_ROOT}/dotfiles/vim/vi_cfg.vim ${HOME}/.config/nvim/init.vim
ln -s ${MY_ENV_ROOT}/dotfiles/vim/.editorconfig ${HOME}/.editorconfig
ln -s ${MY_ENV_ROOT}/dotfiles/eslint/.eslintrc.js ${HOME}/.eslintrc.js
