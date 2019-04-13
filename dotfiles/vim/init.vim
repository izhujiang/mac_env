" vim-bootstrap b0a75e4

"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************
if has('vim_starting')
  set nocompatible               " Be iMproved
endif

let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

let g:vim_bootstrap_langs = "go,html,javascript,typescript,python,scala"
let g:vim_bootstrap_editor = "nvim"				" nvim or vim

if(has("mac") || has("macunix"))
    let g:python2_host_prog = '/usr/local/bin/python'
    let g:python3_host_prog = '/usr/local/bin/python3'
elseif(has("unix"))
    let g:python2_host_prog = '/usr/bin/python'
    let g:python3_host_prog = '/usr/bin/python3'
else
    echo "setting up python_host_prog plz"
endif

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif


" YouCompleteMe unavailable: requires UTF-8 encoding.
set encoding=utf-8
" Set general(built-in) options before plugins
source ${MY_ENV_ROOT}/dotfiles/vim/general.vim

" Required:
call plug#begin(expand('~/.config/nvim/plugged'))

"*****************************************************************************
"" Plug install packages
"*****************************************************************************
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Bookmark plugin
Plug 'MattesGroeger/vim-bookmarks'

" Vim colorscheme
" colorscheme
" Plug 'tomasr/molokai'
Plug 'fatih/molokai'

" Eclipse like task list
Plug 'vim-scripts/TaskList.vim'

" Status/tabline for vim
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks.
Plug 'airblade/vim-gitgutter'

" Git wrapper
Plug 'tpope/vim-fugitive'

Plug 'majutsushi/tagbar'

" Dark powered shell interface for NeoVim and Vim8.
Plug 'Shougo/deol.nvim'
" Extended session management for Vim, require vmi-misc
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

" --------------------------------------------------------------------
"  vim-go need ctrlp.vim
" Fuzzy file, buffer, mru, tag, etc finder.
Plug 'ctrlpvim/ctrlp.vim'

" Fuzzy Finding: CtrlP –> fzf, because it's asynchronous and fast
if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif
" Grep search tools integration with Vim
Plug 'vim-scripts/grep.vim'

" --------------------------------------------------------------------
" Display the indention levels with thin vertical lines
Plug 'Yggdroot/indentLine'
"A simple, easy-to-use Vim alignment plugin
Plug 'junegunn/vim-easy-align'
" Comment stuff out
Plug 'tpope/vim-commentary'
" provides insert mode auto-completion for quotes, parens, brackets, etc.
" Plug 'Raimondi/delimitMate'
Plug 'jiangmiao/auto-pairs'
" Provides insert mode auto-completion for quotes, parens, brackets, etc.
Plug 'tpope/vim-surround'

" A Narrow Region Plugin for vim, focus on a selected region while making the rest inaccessible.
Plug 'chrisbra/NrrwRgn'

" True Sublime Text style multiple selections for Vim
" Plug 'terryma/vim-multiple-cursors'

" Syntax Highlighting
" linting: Syntastic –> ALE
" A bunch of syntastic settings were ripped out, and replaced with a slim ALE configuration.
" For each language, ALE will automatically detect linters that are installed on the system.
Plug 'w0rp/ale'

" a suite consist of supertab, YouCompleteMe and ultisnips
Plug 'ervandew/supertab'

" Build YouCompleteMe
function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    " "!./install.py --clang-completer --go-completer --js-completer
    !python3 ./install.py --clang-completer --go-completer --js-completer --java-completer
    " ts-server with flag --ts-completer is two slow at this stag, waiting for coming version....
    " !python3 ./install.py --clang-completer --go-completer --ts-completer --java-completer
  endif
endfunction
" Todo: install(update and build automaticlly) YouCompleteMe like vimpro
" A code-completion engine for Vim
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'bronson/vim-trailing-whitespace'

"*****************************************************************************
"" Custom bundles
"*****************************************************************************

"" ------------Golang Bundle ----------------------------------
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries', 'for':'go'}
Plug 'AndrewRadev/splitjoin.vim', {'for': 'go'}

"" ------------Python Bundle ----------------------------------
" Python Lang Bundle
" YouCompleteMe has built-in jedi engine.
" Plug 'davidhalter/jedi-vim'

" Vim python-mode. PyLint, Rope, Pydoc, breakpoints from box
" Sorry. Waiting for stable version. master version does't support vim-plug.
" Plug 'python-mode/python-mode', { 'for': 'python', 'do': 'git submodule update --init --recursive'}
Plug 'python-mode/python-mode', { 'for': 'python' }

" --------------Java----------------------------------------------
" Todo: config for multi-filetype and dorp other relative plugins as js-beautify
" format source code before saving files
" A (Neo)vim plugin for formatting code, supporting multi filetypes
Plug 'sbdchd/neoformat', {'for': 'java'}

Plug 'tfnico/vim-gradle', { 'for': [ 'java', 'groovy' ] }
Plug 'airblade/vim-rooter', { 'for': [ 'java', 'groovy' ] }


"     " sbt-vim
"     Plug 'ktvoelker/sbt-vim' , { 'for': 'scala' }
" endif
" " vim-scala
" Plug 'derekwyatt/vim-scala' , { 'for': 'scala' }

"" ------------Html/css/Javascript Bundle ----------------------------------
Plug 'hail2u/vim-css3-syntax'
Plug 'gorodinskiy/vim-coloresque'
Plug 'tpope/vim-haml'

" Javascript Bundle, html/css
" Enhanced javascript syntax file for Vim
Plug 'pangloss/vim-javascript', {'for': ['javascript', 'html', 'css']}
" Plug 'mxw/vim-jsx', {'for': 'javascript'}
" Prettier is an opinionated code formatter with support for: JavaScript JSX Flow TypeScript CSS JSON GraphQL Markdown YAML
Plug 'prettier/vim-prettier', {
    \ 'do': 'yarn install',
    \ 'for': ['html', 'javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue']}

" Provides support for expanding abbreviations similar to emmet.
Plug 'mattn/emmet-vim', {'for': ['html', 'css', 'javascript','typescript']}
" Beautify.vim is reformatter and converter.
" Plug 'alpaca-tc/beautify.vim', {'for': ['html', 'css', 'javascript']}

" Flow is a static type checker for your JavaScript code.
" Plug 'flowtype/vim-flow', {'for': 'javascript'}

" plugs for TypeScript
Plug 'leafgarland/typescript-vim', {'for': 'typescript'}

" yast will set filetype as typescript.tsx which YouCompleteMe can't work with ycm_semantic_triggers
" yast will set filetype=typescript.tsx
" Plug 'HerringtonDarkholme/yats.vim', {'for': 'typescript'}
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


"*****************************************************************************
"" Include user's extra bundle
if filereadable(expand("~/.config/nvim/local_bundles.vim"))
  source ~/.config/nvim/local_bundles.vim
endif

call plug#end()

source ${MY_ENV_ROOT}/dotfiles/vim/plugins/molokai.vim

source ${MY_ENV_ROOT}/dotfiles/vim/plugins/nerdtree.vim
source ${MY_ENV_ROOT}/dotfiles/vim/plugins/vim-airline.vim

source ${MY_ENV_ROOT}/dotfiles/vim/plugins/grep.vim


source ${MY_ENV_ROOT}/dotfiles/vim/plugins/ultisnips.vim
source ${MY_ENV_ROOT}/dotfiles/vim/plugins/ycm.vim
" source ${MY_ENV_ROOT}/dotfiles/vim/plugins/completeparameter.vim
" source ${MY_ENV_ROOT}/dotfiles/vim/plugins/deoplete.vim

source ${MY_ENV_ROOT}/dotfiles/vim/plugins/ale.vim

source ${MY_ENV_ROOT}/dotfiles/vim/plugins/vim-commentary.vim
source ${MY_ENV_ROOT}/dotfiles/vim/plugins/vim-easyalign.vim
source ${MY_ENV_ROOT}/dotfiles/vim/plugins/indentline.vim

" source ${MY_ENV_ROOT}/dotfiles/vim/plugins/vim-c.vim
source ${MY_ENV_ROOT}/dotfiles/vim/plugins/python-mode.vim
source ${MY_ENV_ROOT}/dotfiles/vim/plugins/vim-go.vim
source ${MY_ENV_ROOT}/dotfiles/vim/plugins/vim-java.vim
source ${MY_ENV_ROOT}/dotfiles/vim/plugins/neoformat.vim
source ${MY_ENV_ROOT}/dotfiles/vim/plugins/vim-javascript.vim
" source ${MY_ENV_ROOT}/dotfiles/vim/plugins/vim-jsx.vim
source ${MY_ENV_ROOT}/dotfiles/vim/plugins/vim-prettier.vim
source ${MY_ENV_ROOT}/dotfiles/vim/plugins/emmet-vim.vim
source ${MY_ENV_ROOT}/dotfiles/vim/plugins/typescript-vim.vim
source ${MY_ENV_ROOT}/dotfiles/vim/plugins/vim-markdown.vim
source ${MY_ENV_ROOT}/dotfiles/vim/plugins/markdown_composer.vim

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

" terminal emulation
if g:vim_bootstrap_editor == 'nvim'
  nnoremap <silent> <leader>sh :split term://zsh<CR>
  " To map <Esc> to exit terminal-mode:
  tnoremap <Esc> <C-\><C-n>
  tnoremap <M-[> <Esc>
  tnoremap <C-v><Esc> <Esc>

  " To simulate |i_CTRL-R| in terminal-mode:
  tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
  "
  " Set option key act as +ESC in iterm2's profile(keys)
  " " Terminal mode:
  " tnoremap <M-h> <c-\><c-n><c-w>h
  " tnoremap <M-j> <c-\><c-n><c-w>j
  " tnoremap <M-k> <c-\><c-n><c-w>k
  " tnoremap <M-l> <c-\><c-n><c-w>l
  " " Insert mode:
  " inoremap <M-h> <Esc><c-w>h
  " inoremap <M-j> <Esc><c-w>j
  " inoremap <M-k> <Esc><c-w>k
  " inoremap <M-l> <Esc><c-w>l
  " " Visual mode:
  " vnoremap <M-h> <Esc><c-w>h
  " vnoremap <M-j> <Esc><c-w>j
  " vnoremap <M-k> <Esc><c-w>k
  " vnoremap <M-l> <Esc><c-w>l
  " " Normal mode:
  " nnoremap <M-h> <c-w>h
  " nnoremap <M-j> <c-w>j
  " nnoremap <M-k> <c-w>k
  " nnoremap <M-l> <c-w>l

else
  " nnoremap <silent> <leader>sh :VimShellCreate<CR>
endif

if has('nvim')
    autocmd TermOpen term://* startinsert
    autocmd TermOpen setlocal statusline=%{b:term_title}

endif
"*****************************************************************************
"" Custom configs
"*****************************************************************************

augroup completion_preview_close
  autocmd!
  if v:version > 703 || v:version == 703 && has('patch598')
    autocmd CompleteDone * if !&previewwindow && &completeopt =~ 'preview' | silent! pclose | endif
  endif
augroup END

"*****************************************************************************

"" Include user's local vim config
if filereadable(expand("~/.config/nvim/local_init.vim"))
  source ~/.config/nvim/local_init.vim
endif
