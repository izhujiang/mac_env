#!/bin/sh
set -u

# install vim and nvim plugins
printf "install my dev env ...\n"
printf "Install plugins for vim/nvim......\n"

for VI_HOME in ${HOME}/.vim ${HOME}/.config/nvim
do
    for CFG_FILE in init.vim general.vim plugins.vim plugins/ui.vim plugins/explorer.vim plugins/coding.vim plugins/langs.vim plugins/misc.vim
    do
        curl -fsSL --create-dirs -o "${VI_HOME}/${CFG_FILE}" https://raw.githubusercontent.com/izhujiang/my_env/master/dotfiles/vi/${CFG_FILE}
    done


    [ -f "${VI_HOME}/local.vim" ] || curl -fsSL --create-dirs -o "${VI_HOME}/local.vim" https://raw.githubusercontent.com/izhujiang/my_env/master/dotfiles/vi/local.vim

    [ -d "${VI_HOME}/third_party/ycmd-lsp" ] || git clone https://github.com/ycm-core/lsp-examples.git "${VI_HOME}/third_party/ycmd-lsp"
    # FlagsLsp=( --enable-bash --enable-docker --enable-json --enable-yaml --enable-viml --enable-.git --enable-test)
    cd "${VI_HOME}/third_party/ycmd-lsp" && git pull && python3 ./install.py --enable-bash --enable-docker --enable-json --enable-yaml --enable-viml --enable-.git --enable-test
done

for CFG_FILE in .editorconfig .ycm_extra_conf.py
do
    curl -fsSL --create-dirs -o "${HOME}/${CFG_FILE}" "https://raw.githubusercontent.com/izhujiang/my_env/master/dotfiles/vi/${CFG_FILE}"
done

VI_HOME=${HOME}/.vim
if [ -L "${VI_HOME}/.vimrc" ]; then
	unlink "${HOME}/.vimrc"
fi
mv "${VI_HOME}/init.vim" "${VI_HOME}/.vimrc"
ln -s "${VI_HOME}/.vimrc" "${HOME}/.vimrc"

export GOPATH=${HOME}/workspace/go
printf "vim-go check GOPATH: %s \n" "${GOPATH}"

printf "install plugins for vim...\n"
vim +'silent! PlugInstall --sync' +qall

printf "install plugins for nvim...\n"
nvim --headless +PlugInstall +qall

sleep 1
