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

" Required:
call plug#begin(expand('~/.vim/plugged'))

"*****************************************************************************
"" Plug install packages
"*****************************************************************************
" file system explorer
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'

" Fuzzy file, buffer, mru, tag, etc finder.
Plug 'ctrlpvim/ctrlp.vim'

" Eclipse like task list
Plug 'vim-scripts/TaskList.vim'

" Class outline viewer for Vim
Plug 'majutsushi/tagbar'

" Bookmark plugin
Plug 'MattesGroeger/vim-bookmarks'

" Interactive command execution in Vim.
let g:make = 'gmake'
if exists('make')
    let g:make = 'make'
endif
Plug 'Shougo/vimproc.vim', {'do': g:make}

" Status/tabline for vim
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


" ----------------------------------
" Display the indention levels with thin vertical lines
Plug 'Yggdroot/indentLine'

" Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks.
Plug 'airblade/vim-gitgutter'

" Syntax checking hacks for vim, https://github.com/vim-syntastic/syntastic
Plug 'vim-syntastic/syntastic'
" Syntastic aims to provide a common interface to syntax checkers for as many languages as possible.
" For particular languages, there are, of course, other plugins that provide more functionality than syntastic. You
" might want to take a look at ghcmod-vim, jedi-vim, python-mode, vim-go, or YouCompleteMe.

" ---------------------------------
if v:version >= 704
  " The ultimate snippet solution for Vim
  " Snippet engines
  Plug 'SirVer/ultisnips'
endif
" vim-snipmate default snippets
Plug 'honza/vim-snippets'

" Provides insert mode auto-completion for quotes, parens, brackets, etc.
Plug 'Raimondi/delimitMate'

"A simple, easy-to-use Vim alignment plugin
Plug 'junegunn/vim-easy-align'

" Comment stuff out
Plug 'tpope/vim-commentary'

function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py --clang-completer --go-completer --js-completer
  endif
endfunction
" Todo: install(update and build automaticlly) YouCompleteMe like vimpro
" A code-completion engine for Vim
Plug 'Valloric/YouCompleteMe', { 'branch': 'stable', 'do': function('BuildYCM') }

" Highlights trailing whitespace in red and provides :FixWhitespace to fix it.
Plug 'bronson/vim-trailing-whitespace'
"
" No-BS Python code folding for Vim
Plug 'tmhedberg/SimpylFold'

" True Sublime Text style multiple selections for Vim
Plug 'terryma/vim-multiple-cursors'

" ---------------------------------
" Grep search tools integration with Vim
Plug 'vim-scripts/grep.vim'

" Git wrapper
Plug 'tpope/vim-fugitive'

if v:version >= 703
  Plug 'Shougo/vimshell.vim'
endif

Plug 'vimcn/vimcdoc'

" Extended session management for Vim, require vmi-misc
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
"*****************************************************************************
"" Custom bundles
"*****************************************************************************

"" Go Lang Bundle
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}

" Python Lang Bundle
" YouCompleteMe has built-in jedi engine.
" Plug 'davidhalter/jedi-vim'
" Requirements File Format syntax support for Vim
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}

" A nicer Python indentation style for vim
" Plug 'Vimjas/vim-python-pep8-indent'

" Flake8, a static syntax and style checker for Python source code.
" Plug 'nvie/vim-flake8'

" Vim python-mode. PyLint, Rope, Pydoc, breakpoints from box
" Sorry. Waiting for stable version. master version does't support vim-plug.
Plug 'python-mode/python-mode', { 'branch': 'develop', 'do': 'git submodule update --init --recursive'}

" Javascript Bundle, html/css
" Enhanced javascript syntax file for Vim
Plug 'jelera/vim-javascript-syntax'
" Plug 'pangloss/vim-javascript'

" Provides support for expanding abbreviations similar to emmet.
Plug 'mattn/emmet-vim'
" Beautify.vim is reformatter and converter.
Plug 'alpaca-tc/beautify.vim'

" for hugo
Plug 'robertbasic/vim-hugo-helper'
" for markdown
" Plug 'godlygeek/tabular'
" Plug 'plasticboy/vim-markdown'
"
" Instant Markdown previews from VIm!
" You first need to have node.js with npm installed. Then:
" npm -g install instant-markdown-d
" It seems bugs with vim-instant-markdown, so walk around(atom) and wait for update to fix the bug...
" Plug 'suan/vim-instant-markdown'
" au FileType markdown setl shell=bash\ -i

call plug#end()

source ${DOTFILES_DIR}/vim/features.vim
source ${DOTFILES_DIR}/vim/options.vim
source ${DOTFILES_DIR}/vim/commands.vim
source ${DOTFILES_DIR}/vim/events.vim
