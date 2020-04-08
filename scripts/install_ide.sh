#!/bin/sh

# install vim and nvim plugins
printf "install my dev env ...\n"
printf "Install plugins for vim/nvim......\n"

NVIM_CFG_DIR=${HOME}/.config/nvim

CURRENTDATE=`date +"%Y-%m-%d-%H%M"`
for CFG_FILE in ${HOME}/.vim/.vimrc ${NVIM_CFG_DIR}/init.vim ${NVIM_CFG_DIR}/general.vim ${NVIM_CFG_DIR}/plugins.vim ${NVIM_CFG_DIR}/plugins \
                ${HOME}/.editorconfig ${HOME}/.eslintrc.js
do
    if [ -L ${CFG_FILE} ]; then
        unlink ${CFG_FILE}
    else
        if [ -f ${CFG_FILE} || -d ${CFG_FILE} ]; then
            mv ${CFG_FILE} ${CFG_FILE}.bak.${CURRENTDATE}
        fi
    fi
done


for CFG_FILE in init.vim general.vim plugins.vim
do
    curl -fsSL -o ${NVIM_CFG_DIR}/${CFG_FILE} https://raw.githubusercontent.com/izhujiang/my_env/master/dotfiles/vi/${CFG_FILE}
done
ln -s ${NVIM_CFG_DIR}/init.vim ${HOME}/.vim/.vimrc

for CFG_FILE in ale.vim ctrlp.vim easymotion.vim editorconfig.vim emmet-vim.vim fzf.vim grepper.vim indentline.vim jedi.vim \
                molokai.vim neoformat.vim nerdtree.vim python-mode.vim syntastic.vim tagbar.vim typescript.vim ultisnips.vim \
                vim-airline.vim vim-c.vim vim-commentary.vim vim-easyalign.vim vim-fugitive.vim vim-go.vim vim-java.vim \
                vim-javascript.vim vim-jsx.vim vim-markdown.vim vim-prettier.vim vim-test.vim vim-tsx.vim vimshell.vim ycm.vim
do
    curl -fsSL -o ${NVIM_CFG_DIR}/plugins/${CFG_FILE} https://raw.githubusercontent.com/izhujiang/my_env/master/dotfiles/vi/plugins/${CFG_FILE}
done

for CFG_FILE in .editorconfig .eslintrc
do
    curl -fsSL -o ${HOME}/${CFG_FILE} https://raw.githubusercontent.com/izhujiang/my_env/master/dotfiles/vi/${CFG_FILE}
done

printf "vim-go check GOPATH: ${GOPATH}\n"
export GOPATH=${HOME}/workspace/go
printf "install plugins for vim...\n"
vim +PlugInstall +qall
printf "install plugins for nvim...\n"
nvim +PlugInstall +qall

sleep 1
