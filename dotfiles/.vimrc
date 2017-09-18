" Automatic reloading of .vimrc 
autocmd! bufwritepost .vimrc source %
syn on                      "语法支持


source ${DOTFILES_DIR}/vimrc/base.vim

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'

Plugin 'tmhedberg/SimpylFold'
Plugin 'terryma/vim-multiple-cursors'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'vimcn/vimcdoc'

Plugin 'Valloric/YouCompleteMe'

" Track the engine.
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" best Git wrapper
Plugin 'tpope/vim-fugitive'

Plugin 'vim-scripts/TaskList.vim'

" for python dev
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'nvie/vim-flake8'
Plugin 'davidhalter/jedi-vim'

" for golang dev"
Plugin 'fatih/vim-go'
" All of your Plugins must be added before the following line

" for html/css web-dev
Plugin 'mattn/emmet-vim'
Plugin 'alpaca-tc/beautify.vim'

call vundle#end()            " required

" the config of the plugins
source ${DOTFILES_DIR}/vimrc/plugins/nerdtree.vim
source ${DOTFILES_DIR}/vimrc/plugins/syntastic.vim
source ${DOTFILES_DIR}/vimrc/plugins/airline.vim
source ${DOTFILES_DIR}/vimrc/plugins/ycm.vim
source ${DOTFILES_DIR}/vimrc/plugins/ultisnips.vim
source ${DOTFILES_DIR}/vimrc/plugins/emmet.vim
source ${DOTFILES_DIR}/vimrc/plugins/mulcursors.vim

" setting for supporting editing files
source ${DOTFILES_DIR}/vimrc/langs/py.vim
source ${DOTFILES_DIR}/vimrc/langs/go.vim
source ${DOTFILES_DIR}/vimrc/langs/js.vim
source ${DOTFILES_DIR}/vimrc/langs/html.vim
source ${DOTFILES_DIR}/vimrc/langs/css.vim

" the config for the features
" source ${DOTFILES_DIR}/vimrc/features/virtualenv.vim
source ${DOTFILES_DIR}/vimrc/features/tmux.vim
