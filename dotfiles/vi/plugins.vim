"*****************************************************************************
Plug 'editorconfig/editorconfig-vim'
" https://blog.stevenocchipinti.com/2016/12/28/using-netrw-instead-of-nerdtree-for-vim/
" using builtin file explorer(netrw) instead. However, what about the nerdtree-git
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Bookmark plugin, config it later.
" Plug 'MattesGroeger/vim-bookmarks'

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

" Universal CTags: tagging engine that scans project files and generates tag files.
" Autotag: automatically update the tag files after each save.
" Tagbar: displays a window with a hierarchical list of tags in the current file.
Plug 'majutsushi/tagbar'

" Dark powered shell interface for NeoVim and Vim8.
if has('nvim-0.1')
    Plug 'Shougo/deol.nvim'
endif
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

" Use your favorite grep tool (ag, ack, git grep, ripgrep, pt, sift, findstr, grep) to start an 'asynchronous' search.
" All matches will be put in a quickfix or location list.
Plug 'mhinz/vim-grepper'
" lazy loading, but grepper convenience command will be disable.
" Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }

Plug 'easymotion/vim-easymotion'


" --------------------------------------------------------------------
" Display the indention levels with thin vertical lines
Plug 'Yggdroot/indentLine'
"A simple, easy-to-use Vim alignment plugin
Plug 'junegunn/vim-easy-align'

" Comment stuff out, Use gcc to comment out a line (takes a count), gc to comment out the target of a motion(likes gcap),
" gc in visual mode to comment out the selection, and gc in operator pending mode to target a comment.
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
    " !python3 ./install.py --clang-completer --go-completer --js-completer
    " !python3 ./install.py --clangd-completer --go-completer --ts-completer --rust-completer --java-completer
    !python3 ./install.py --clangd-completer --go-completer --ts-completer
    " ts-server with flag --ts-completer is two slow at this stag, waiting for coming version....
  endif
endfunction
" Todo: install(update and build automaticlly) YouCompleteMe like vimpro
" A code-completion engine for Vim
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

if has('nvim-0.1') || v:version >= 704
  " The ultimate snippet solution for Vim
  " Snippet engines
    Plug 'SirVer/ultisnips'
    " vim-snipmate default snippets
    Plug 'honza/vim-snippets'
endif

" Asynchronous build and test dispatcher
Plug 'tpope/vim-dispatch'

if has('nvim-0.1')
    Plug 'radenling/vim-dispatch-neovim'
endif

" ale_fixer does ['remove_trailing_lines', 'trim_whitespace'] when on_save.
" Plug 'bronson/vim-trailing-whitespace'
" A Vim wrapper for running tests on different granularities.
Plug 'janko/vim-test'

" vim plugin to interact with tmux
Plug 'benmills/vimux'
" Plug 'vimcn/vimcdoc'
" Simplified and community-driven man pages
Plug 'wlemuel/vim-tldr'

"*****************************************************************************
"" Custom Language bundles
"*****************************************************************************

"" ------------Golang Bundle ----------------------------------
Plug 'sebdah/vim-delve'
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
" Plug 'prettier/vim-prettier', {
    " \ 'do': 'yarn install',
    " \ 'for': ['html', 'javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue']}

" Provides support for expanding abbreviations similar to emmet.
Plug 'mattn/emmet-vim', {'for': ['html', 'css', 'javascript','typescript']}

" plugs for TypeScript
Plug 'leafgarland/typescript-vim', {'for': 'typescript'}
" Plug 'HerringtonDarkholme/yats.vim', {'for': 'typescript'}

" yast will set filetype as typescript.tsx which YouCompleteMe can't work with ycm_semantic_triggers
" yast will set filetype=typescript.tsx
" Plug 'HerringtonDarkholme/yats.vim', {'for': 'typescript'}
" --------------Markdown----------------------------------------------
" for makrdown and hugo
" Plug 'robertbasic/vim-hugo-helper', {'for': 'Markdown'}

" Build MarkdownComposer
" function! BuildComposer(info)
"   if a:info.status != 'unchanged' || a:info.force
"     if has('nvim-0.1')
"       !cargo build --release
"     else
"       !cargo build --release --no-default-features --features json-rpc
"     endif
"   endif
" endfunction
" Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer'), 'for': 'Markdown' }
