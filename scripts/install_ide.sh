#!/bin/sh
set -u

# install vim and nvim plugins
printf "install my dev env ...\n"
printf "Install plugins for vim/nvim......\n"

NVIM_CFG_DIR=${HOME}/.config/nvim

CURRENTDATE=$(date +"%Y-%m-%d-%H%M")
for CFG_FILE in ${HOME}/.vim/.vimrc ${NVIM_CFG_DIR}/init.vim ${NVIM_CFG_DIR}/general.vim ${NVIM_CFG_DIR}/plugins.vim ${NVIM_CFG_DIR}/plugins ${HOME}/.editorconfig ${HOME}/.ycm_extra_conf.py
do
    if [ -L "${CFG_FILE}" ]; then
        unlink "${CFG_FILE}"
    else
        if [ -f "${CFG_FILE}" ] || [ -d "${CFG_FILE}" ]; then
            mv "${CFG_FILE}" "${CFG_FILE}.${CURRENTDATE}"
        fi
    fi
done


for CFG_FILE in init.vim general.vim plugins.vim plugins/ui.vim plugins/explorer.vim plugins/coding.vim plugins/langs.vim plugins/misc.vim
do
    curl -fsSL --create-dirs -o "${NVIM_CFG_DIR}/${CFG_FILE}" https://raw.githubusercontent.com/izhujiang/my_env/master/dotfiles/vi/${CFG_FILE}
done
ln -s "${NVIM_CFG_DIR}"/init.vim "${HOME}"/.vimrc

# todo: only download necessary .vim files
# for CFG_FILE in airline.vim ale.vim commentary.vim easyalign.vim easymotion.vim editorconfig.vim emmet.vim fugitive.vim fzf.vim \
#                 indentline.vim langs.vim molokai.vim nerdtree.vim tagbar.vim test.vim tldr.vim ultisnips.vim ycm.vim
# do
#     curl -fsSL --create-dirs -o "${NVIM_CFG_DIR}/plugins/${CFG_FILE}" "https://raw.githubusercontent.com/izhujiang/my_env/master/dotfiles/vi/plugins/${CFG_FILE}"
# done

for CFG_FILE in .editorconfig .ycm_extra_conf.py
do
    curl -fsSL --create-dirs -o "${HOME}/${CFG_FILE}" "https://raw.githubusercontent.com/izhujiang/my_env/master/dotfiles/vi/${CFG_FILE}"
done

export GOPATH=${HOME}/workspace/go
printf "vim-go check GOPATH: %s \n" "${GOPATH}"

printf "install plugins for vim...\n"
vim +'silent! PlugInstall' +qall
[ -d "${HOME}/.vim/third_party/ycmd-lsp" ] || git clone https://github.com/ycm-core/lsp-examples.git "${HOME}/.vim/third_party/ycmd-lsp"
FlagsLsp=( --enable-bash --enable-docker --enable-json --enable-yaml --enable-viml --enable-.git --enable-test)
cd "${HOME}/.vim/third_party/ycmd-lsp" && git pull && python3 ./install.py "${FlagsLsp[@]}"

printf "install plugins for nvim...\n"
nvim +PlugInstall +qall
[ -d "${HOME}/.config/nvim/third_party/ycmd-lsp" ] || git clone https://github.com/ycm-core/lsp-examples.git "${HOME}/.config/nvim/third_party/ycmd-lsp"
cd "${HOME}/.config/nvim/third_party/ycmd-lsp" && git pull && python3 ./install.py "${FlagsLsp[@]}"

sleep 1
