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
" file system explorer, using builtin file explorer(netrw) instead. However, what about the nerdtree-git
" https://blog.stevenocchipinti.com/2016/12/28/using-netrw-instead-of-nerdtree-for-vim/
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Fuzzy file, buffer, mru, tag, etc finder.
" Plug 'ctrlpvim/ctrlp.vim'
" Fuzzy Finding: CtrlP –> fzf, because it's asynchronous and fast
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Eclipse like task list
Plug 'vim-scripts/TaskList.vim'

" 
" Universal CTags: tagging engine that scans project files and generates tag files.
" Autotag: automatically update the tag files after each save.
" Tagbar: displays a window with a hierarchical list of tags in the current file.

" Bookmark plugin
Plug 'MattesGroeger/vim-bookmarks'

" Vim colorscheme
" Plug 'altercation/vim-colors-solarized'
" colorscheme
Plug 'fatih/molokai'

" Status/tabline for vim
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks.
Plug 'airblade/vim-gitgutter'

" Git wrapper
Plug 'tpope/vim-fugitive'

" Extended session management for Vim, require vmi-misc
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

" Vim8 has builtin terminal support
" " Install VimShell and its depencency vimproc
" Plug 'Shougo/vimproc.vim', {'do' : 'make'}
" "  Powerful shell in vim
" if v:version >= 703
"   Plug 'Shougo/vimshell.vim'
" endif

" vim plugin to interact with tmux
Plug 'benmills/vimux'
" Plug 'vimcn/vimcdoc'

" --------------------------------------------------------------------
" Grep search tools integration with Vim
Plug 'vim-scripts/grep.vim'

" Display the indention levels with thin vertical lines
Plug 'Yggdroot/indentLine'

" Provides insert mode auto-completion for quotes, parens, brackets, etc.
" Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'

"A simple, easy-to-use Vim alignment plugin
Plug 'junegunn/vim-easy-align'

" Comment stuff out
Plug 'tpope/vim-commentary'

" Highlights trailing whitespace in red and provides :FixWhitespace to fix it.
Plug 'bronson/vim-trailing-whitespace'

" provides insert mode auto-completion for quotes, parens, brackets, etc.
" Plug 'Raimondi/delimitMate'
Plug 'jiangmiao/auto-pairs'

" A Narrow Region Plugin for vim, focus on a selected region while making the rest inaccessible.
Plug 'chrisbra/NrrwRgn'

" A vim plugin that simplifies the transition between multiline and single-line code
" Plug 'AndrewRadev/splitjoin.vim'

" True Sublime Text style multiple selections for Vim
" Plug 'terryma/vim-multiple-cursors'

" Syntax Highlighting
" linting: Syntastic –> ALE
" A bunch of syntastic settings were ripped out, and replaced with a slim ALE configuration.
" For each language, ALE will automatically detect linters that are installed on the system.
Plug 'w0rp/ale'

" ---------------------------------
if v:version >= 704
  " The ultimate snippet solution for Vim
  " Snippet engines
    Plug 'SirVer/ultisnips'
    " vim-snipmate default snippets
    Plug 'honza/vim-snippets'
endif

" Build YouCompleteMe
function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    " "!./install.py --clang-completer --go-completer --js-completer
    !python ./install.py --clang-completer --go-completer --js-completer --java-completer
  endif
endfunction

" Todo: install(update and build automaticlly) YouCompleteMe like vimpro
" A code-completion engine for Vim
" Plug 'Valloric/YouCompleteMe', { 'branch': 'stable', 'do': function('BuildYCM') }
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
" Complete parameter after select the completion.
" Plug 'tenfyzhong/CompleteParameter.vim'

" It takes huge time to download jdt.ls to supporting YouCompleteMe for java, which is currently experimental.
" Blocking YouCompleteMe in let g:ycm_filetype_blacklist and ycm_filetype_specific_completion_to_disable
" Waiting ......
" Plug 'artur-shaik/vim-javacomplete2', {'for':'java'}

"*****************************************************************************
"" Language specific bundles
"*****************************************************************************

"" ------------Golang Bundle ----------------------------------
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries', 'for':'go'}

"" ------------Python Bundle ----------------------------------
" Python Lang Bundle
" YouCompleteMe has built-in jedi engine.
" Plug 'davidhalter/jedi-vim'
" Requirements File Format syntax support for Vim
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}

" No-BS Python code folding for Vim
Plug 'tmhedberg/SimpylFold', {'for': 'python'}

" A nicer Python indentation style for vim
" Plug 'Vimjas/vim-python-pep8-indent'

" Flake8, a static syntax and style checker for Python source code.
" Plug 'nvie/vim-flake8'

" Vim python-mode. PyLint, Rope, Pydoc, breakpoints from box
" Sorry. Waiting for stable version. master version does't support vim-plug.
Plug 'python-mode/python-mode', { 'for': 'python', 'do': 'git submodule update --init --recursive'}
" Plug 'python-mode/python-mode', { 'for': 'python' }

"" ------------Html/css/Javascript Bundle ----------------------------------
" Javascript Bundle, html/css
" Enhanced javascript syntax file for Vim
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'mxw/vim-jsx', {'for': 'javascript'}
" Prettier is an opinionated code formatter with support for: JavaScript JSX Flow TypeScript CSS JSON GraphQL Markdown YAML
Plug 'prettier/vim-prettier', {
    \ 'do': 'npm -g install',
    \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue']}

" Provides support for expanding abbreviations similar to emmet.
Plug 'mattn/emmet-vim', {'for': ['html', 'css', 'javascript']}
" Beautify.vim is reformatter and converter.
" Plug 'alpaca-tc/beautify.vim', {'for': ['html', 'css', 'javascript']}

" Flow is a static type checker for your JavaScript code.
" Plug 'flowtype/vim-flow', {'for': 'javascript'}

" --------------Markdown----------------------------------------------
" for makrdown and hugo
" Plug 'robertbasic/vim-hugo-helper', {'for': 'Markdown'}

" Build MarkdownComposer
function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer'), 'for': 'Markdown' }

" --------------Java----------------------------------------------
" Todo: config for multi-filetype and dorp other relative plugins as js-beautify
" format source code before saving files
" A (Neo)vim plugin for formatting code, supporting multi filetypes
Plug 'sbdchd/neoformat', {'for': 'java'}

" Asynchronous linting and make framework for Neovim/Vim, not good enought for gradle. using gradle via shell instead.
" Plug 'neomake/neomake'
Plug 'tfnico/vim-gradle', { 'for': [ 'java', 'groovy' ] }
Plug 'airblade/vim-rooter', { 'for': [ 'java', 'groovy' ] }
call plug#end()
" Enable matchit plugin shiped with vim
runtime macros/matchit.vim


if exists('$TMUX')
  set  term=screen-256color
endif

source ${MY_ENV_ROOT}/dotfiles/vim/general.vim

source ${MY_ENV_ROOT}/dotfiles/vim/plugins/nerdtree.vim
" source ${MY_ENV_ROOT}/dotfiles/vim/plugins/ctrlp.vim
source ${MY_ENV_ROOT}/dotfiles/vim/plugins/powerline.vim

source ${MY_ENV_ROOT}/dotfiles/vim/plugins/ultrisnips.vim
source ${MY_ENV_ROOT}/dotfiles/vim/plugins/ycm.vim
" source ${MY_ENV_ROOT}/dotfiles/vim/plugins/completeparameter.vim

source ${MY_ENV_ROOT}/dotfiles/vim/plugins/ale.vim

source ${MY_ENV_ROOT}/dotfiles/vim/plugins/vim-commentary.vim
source ${MY_ENV_ROOT}/dotfiles/vim/plugins/vim-easyalign.vim
source ${MY_ENV_ROOT}/dotfiles/vim/plugins/indentline.vim


source ${MY_ENV_ROOT}/dotfiles/vim/plugins/vim-go.vim

source ${MY_ENV_ROOT}/dotfiles/vim/plugins/neoformat.vim

source ${MY_ENV_ROOT}/dotfiles/vim/plugins/python-mode.vim

source ${MY_ENV_ROOT}/dotfiles/vim/plugins/vim-javascript.vim
source ${MY_ENV_ROOT}/dotfiles/vim/plugins/vim-prettier.vim
source ${MY_ENV_ROOT}/dotfiles/vim/plugins/emmet-vim.vim

source ${MY_ENV_ROOT}/dotfiles/vim/plugins/vim-markdown.vim
source ${MY_ENV_ROOT}/dotfiles/vim/plugins/markdown_composer.vim
