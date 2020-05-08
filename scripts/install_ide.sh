#!/bin/sh
set -u

# install vim and nvim plugins
printf "install my dev env ...\n"
printf "Install plugins for vim/nvim......\n"

NVIM_CFG_DIR=${HOME}/.config/nvim

CURRENTDATE=$(date +"%Y-%m-%d-%H%M")
for CFG_FILE in ${HOME}/.vim/.vimrc ${NVIM_CFG_DIR}/init.vim ${NVIM_CFG_DIR}/general.vim ${NVIM_CFG_DIR}/plugins.vim ${NVIM_CFG_DIR}/plugins ${HOME}/.editorconfig
do
    if [ -L "${CFG_FILE}" ]; then
        unlink "${CFG_FILE}"
    else
        if [ -f "${CFG_FILE}" ] || [ -d "${CFG_FILE}" ]; then
            mv "${CFG_FILE}" "${CFG_FILE}.${CURRENTDATE}"
        fi
    fi
done


for CFG_FILE in init.vim general.vim plugins.vim
do
    curl -fsSL --create-dirs -o "${NVIM_CFG_DIR}/${CFG_FILE}" https://raw.githubusercontent.com/izhujiang/my_env/master/dotfiles/vi/${CFG_FILE}
done
ln -s "${NVIM_CFG_DIR}"/init.vim "${HOME}"/.vimrc

# todo: only download necessary .vim files
for CFG_FILE in ale.vim ctrlp.vim easymotion.vim editorconfig.vim vim-emmet.vim fzf.vim grepper.vim indentline.vim \
                molokai.vim nerdtree.vim tagbar.vim ultisnips.vim \
                vim-airline.vim vim-commentary.vim vim-easyalign.vim vim-fugitive.vim vim-test.vim ycm.vim
do
    curl -fsSL --create-dirs -o "${NVIM_CFG_DIR}/plugins/${CFG_FILE}" "https://raw.githubusercontent.com/izhujiang/my_env/master/dotfiles/vi/plugins/${CFG_FILE}"
done

for CFG_FILE in .editorconfig .ycm_extra_conf.py
do
    curl -fsSL --create-dirs -o "${HOME}/${CFG_FILE}" "https://raw.githubusercontent.com/izhujiang/my_env/master/dotfiles/vi/${CFG_FILE}"
done
printf "vim-go check GOPATH: %s \n" "${GOPATH}"
export GOPATH=${HOME}/workspace/go

printf "install plugins for vim...\n"
vim +'silent! PlugInstall' +qall
[ -d "${HOME}/.vim/plugged/ycmd-lsp" ] || git clone https://github.com/ycm-core/lsp-examples.git "${HOME}/.vim/plugged/ycmd-lsp"
FlagsLsp=( --enable-bash --enable-docker --enable-json --enable-yaml --enable-viml --enable-.git --enable-test)
cd "${HOME}/.vim/plugged/ycmd-lsp" && git pull && python3 ./install.py "${FlagsLsp[@]}"

printf "install plugins for nvim...\n"
nvim +PlugInstall +qall
[ -d "${HOME}/.config/nvim/plugged/ycmd-lsp" ] || git clone https://github.com/ycm-core/lsp-examples.git "${HOME}/.config/nvim/plugged/ycmd-lsp"
cd "${HOME}/.config/nvim/plugged/ycmd-lsp" && git pull && python3 ./install.py "${FlagsLsp[@]}"

sleep 1
