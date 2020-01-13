" Automatic reloading of .vimrc
" autocmd! bufwritepost .vimrc source %
syn on                      "语法支持
"Fast reloading of the .vimrc
map <silent> <leader>sv :source ~/.vimrc<cr>

"*****************************************************************************
"" Vim-PLug core
"****************************************************************************
if has('vim_starting')
  set nocompatible               " Be iMproved
endif

let vimplug_exists=expand('~/.vim/autoload/plug.vim')
" support with http://www.vim-bootstrap.com/
let g:vim_bootstrap_langs = "go,javascript,python"
let g:vim_bootstrap_editor = "vim"				" nvim or vim

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"

 endif
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" YouCompleteMe unavailable: requires UTF-8 encoding.
set encoding=utf-8

" Set general(built-in) options before plugins
source ${MY_ENV_ROOT}/dotfiles/vim/general.vim
" Required:
call plug#begin(expand('~/.vim/plugged'))
    source ${MY_ENV_ROOT}/dotfiles/vim/plugins.vim
call plug#end()
" Enable matchit plugin shiped with vim
runtime macros/matchit.vim

if exists('$TMUX')
  set  term=screen-256color
endif


if filereadable(vimplug_exists)
    " for plugin in ${MY_ENV_ROOT}/dotfiles/vim/plugins/*.vim
    for plugin in split(glob('${MY_ENV_ROOT}/dotfiles/vim/plugins/*.vim'), '\n')
        " source plugin
        exe 'source' plugin
    endfor
endif
