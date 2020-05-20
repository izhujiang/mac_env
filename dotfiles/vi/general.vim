"------------------------------------------------------------------------------
" General
"------------------------------------------------------------------------------
syntax on
" Enable filetype plugins
filetype plugin indent on    " required

" YouCompleteMe unavailable: requires UTF-8 encoding.
set encoding=utf-8
" Encoding
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  " set encoding=utf-8
  set fileencodings=utf-8,gbk
endif

let mapleader = ','
" mapping the reverse character search command to another key.
noremap \ ','
" By default timeoutlen is 1000 ms
set timeoutlen=500

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

" This is totally awesome - remap jj to escape in insert mode.  You'll never type jj anyway, so it's great!
inoremap jj <esc>

" noremap <silent> <leader>sv :source $MYVIMRC<cr>

" Disable arrowskeys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" TODO: start interactive shell
" instruct vim/nvim to start an interactive shell, which load .bashrc or .zshrc, and then invoke functions by [!! | !} | !G] filter command.
" set shcf=-ic

" set helplang=cn             "help file in chinese

"" Abbreviations:
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Qall qall

nnoremap Q :q<CR>


"------------------------------------------------------------------------------
" Files and buffers
"------------------------------------------------------------------------------
"reload file when modified out of vim
set autoread
" writes the content of the file automatically if you call :make.   vim-go also makes use of this setting.
set autowrite

" Use Unix as the standard file type
set ffs=unix,mac,dos

"" Enable hidden buffers
set hidden

"" Directories for swp files
set nobackup
set nowritebackup
set noswapfile

" When using automatic compilation of your code, some editors have a 'safe write' feature
" that can potentially interfere with recompilation. for Vim :
set backupcopy=yes

" Netrw Style Listing
 let g:netrw_liststyle = 3
 " nnoremap <Leader><Leader> :Tlist<CR><C-W>h<C-W>s:e .<CR><C-W>l:let g:netrw_chgwin=winnr()<CR><C-W>h
 "
"set sub-directories will search for gf, :find command
set path+=**
" set suffixesadd+=.js,.go
" todo: set suffixes
" set suffixes+=
" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Fast saving
nnoremap <Leader>w :w<CR>
nnoremap <Leader>x :x<CR>
" write file with sudo when open file readonly
cmap sw w !sudo tee >/dev/null %

" Switch CWD to the directory of the open buffer
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>
"" Set working directory fro current window
nnoremap <leader>. :lcd %:p:h<CR>

" type %% on vim's command-line prompt, automaticlly expands to the path of the active buffer, just as %:h<tab>.
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/': '%%'

augroup event_file
  autocmd!

  " autocmd FileType java setlocal omnifunc=javacomplete#Complete
  autocmd FileType java,groovy :execute "compiler gradle"
  " vim-commentary
  " define comment string when file type is not built-in support
  autocmd FileType python,shell set commentstring=#\ %s
  " boot vim-go
  " autocmd FileType go # set g:go_** and map <leader>**
  autocmd FileType html,css,javascript,typescript EmmetInstall

  autocmd BufNewFile,BufRead *.gradle setf groovy
  autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
  autocmd BufNewFile,BufRead *.handlebars set filetype=html

  " vim-go
  "By default  syntax highlighting for Go HTML template is enabled for .tmpl files.
  autocmd BufRead,BufNewFile *.gohtml set filetype=gohtmltmpl

  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
  if !exists('*s:setupWrapping')
    function s:setupWrapping()
      set wrap
      set wm=2
      set textwidth=79
    endfunction
  endif

  " Remember cursor position
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

  autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
  autocmd BufWinLeave * call clearmatches()

augroup END

"------------------------------------------------------------------------------
" Editing
"------------------------------------------------------------------------------
" move to begin and end of line
noremap <C-h> ^
noremap <C-l> $

" jump to next change
" nnoremap ]] ]c
" nnoremap [[ [c

set clipboard=unnamed
set nopaste
"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

" Don't redraw while executing macros, register and other command without
" through input (good performance config)
set lazyredraw

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

" Set command-line completion mode
set complete+=i,k
" Completion options (select longest + show menu even if a single match is found)
set completeopt=longest,menu
" set wildmenu wildchar=<Tab> wildcharm=<C-z>

set wildmode=list:longest,list:full
" Ignore compiled files
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

set whichwrap+=<,>,h,l

" Enable Ctrl-A/Ctrl-X to work on octal and hex numbers, as well as characters
set nrformats=octal,hex,alpha

" highlight trailing space
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif

" Toggle paste mode on and off
" map <leader>pp :setlocal paste!<cr>

" Enable folding with the spacebar
nnoremap <C-space> za

" visual shifting (does not exit Visual mode)
" easyly moving of code blocks in visual mode, not good, break the rule of dot command
vnoremap < <gv
vnoremap > >gv

" not good to override J command in ( vipJ, whichi is quiet useful to join multiply lines)
"" Move visual block
vnoremap JJ :m '>+1<CR>gv=gv
vnoremap KK :m '<-2<CR>gv=gv

" search and replace the selected text in visual-mode
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("Ack \"" . l:pattern . "\" " )
    elseif a:direction == 'r'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>
" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('r', '')<CR>


" Remove the Windows ^M - when the encodings gets messed up
" noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" clear  highlight when <leader><cr> is pressed
nnoremap <silent> <leader><cr> :nohlsearch<cr>

" execute last substitute
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" Spell checking
set nospell
" set spelllang=en_ca
" set spelllang=fr
" set dictionary=/usr/share/dict/words,/usr/share/dict/words
" setlocal spellfile+=~/.dict/spellfile/fr.utf-8.add

" Pressing ,ss will toggle and untoggle spell checking
nnoremap <leader>ss :setlocal spell!<cr>

" shortcuts using <leader>
nnoremap <leader>sn ]s
nnoremap <leader>sp [s
nnoremap <leader>sa zg
nnoremap <leader>s? z=
"------------------------------------------------------------------------------
" Search & Replace
" Ignore case when searching
set ignorecase
" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch
" Makes search act like search in modern browsers
set incsearch
" For regular expressions turn magic on
set magic
" Show matching brackets when text indicator is over them
set showmatch

" overwrite vim' grep command output on Unix: grep -n $* /dev/null
" vim/nvim will collect result from external grepprg's standard output.
" which will be overwritten by fzf.vim with 'set grepprg=rg\ --vimgrep' when rg exists
set grepprg=grep\ -n
set grepformat=%f:%l:%m
" To make use of ripgrep within vim
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif


" QuickFix
"------------------------------------------------------------------------------
" It's super useful!
nnoremap <leader>cw :cw 20<cr>
" To go to the next/preview search
nnoremap <leader>cj :cn<cr>
nnoremap <leader>ck :cp<cr>
nnoremap <leader>cc :botright copen<cr>

nnoremap <leader>lw :lw 20<cr>
nnoremap <leader>lj :ln<cr>
nnoremap <leader>lk :lp<cr>
nnoremap <leader>ll :botright lopen<cr>

augroup event_insert
  autocmd!
  autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
  autocmd InsertLeave * match ExtraWhitespace /\s\+$/
augroup END

augroup event_completion_preview_close
  autocmd!
  if v:version > 703 || v:version == 703 && has('patch598')
    autocmd CompleteDone * if !&previewwindow && &completeopt =~ 'preview' | silent! pclose | endif
  endif
augroup END
"------------------------------------------------------------------------------
" Editor UI
"------------------------------------------------------------------------------
set title
set titleold="Terminal"
set titlestring=%F

" Highlight current line - allows you to track cursor position more easily
set cursorline

" Show line, column number, and relative position within a file in the status line
set ruler

" Show line numbers - could be toggled on/off on-fly by pressing F6
set number
set relativenumber

"" Disable the blinking cursor.
set guicursor=a:blinkon0
set scrolloff=3

"" Use modeline overrides
set modeline
set modelines=10

" --folding
set foldmethod=syntax       "代码折叠
set foldlevel=10
set foldnestmax=10
" Make sure that extra margin on left is removed
set foldcolumn=0

" Use spaces instead of tabs
set expandtab
" Be smart when using tabs ;)
set smarttab

" Round indent to multiple of 'shiftwidth' for > and < commands
set shiftround

" --indent
set autoindent "Auto indent
set smartindent "Smart indent
set nowrap "Don't Wrap lines (it is stupid)

" --linebreak
" Linebreak on 500 characters
set linebreak
set textwidth=500

" ------------------------------------------------------------------------------
" Status line
" Always show the status line
set laststatus=2
" Show (partial) commands (or size of selection in Visual mode) in the status line
set showcmd
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

"------------------------------------------------------------------------------
" Buffers, Windows and Tabs:
" A buffer is the in-memory text of a file.  A window is a viewport on a buffer.  A tab page is a collection of windows.
"------------------------------------------------------------------------------
" --tabs
try
  set switchbuf=useopen,usetab,newtab
  set showtabline=2
catch
endtry
" gt/gT
noremap <leader>tn :tabnew<Space>
" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory

nnoremap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>tm :tabmove<CR>
" move tabs
nnoremap <leader>tj :tabnext<CR>
nnoremap <leader>tk :tabprev<CR>
nnoremap <leader>th :tabfirst<CR>
nnoremap <leader>tl :tablast<CR>

augroup event_tab
  autocmd!
  " Let 'tl' toggle between this and the last accessed tab
  let g:lasttab = 1
  autocmd TabLeave * let g:lasttab = tabpagenr()
augroup END

" --buffers
" Specify the behavior when switching between buffers
" move between buffers
nnoremap <leader>bj :bnext<cr>
nnoremap <leader>bk :bprevious<cr>
nnoremap <leader>bh :bfirst<cr>
nnoremap <leader>bl :blast<cr>

" Close the current buffer (w/o closing the currentwindow)
nnoremap <leader>bd :bdelete<cr>
nnoremap <leader>q :bdelete<cr>
" Close all the buffers
nnoremap <leader>bda :1,1000 bd!<cr>

" --windows
" splite at specific region
set splitbelow
set splitright

noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

nnoremap <leader>wh <c-w>h
nnoremap <leader>wj <c-w>j
nnoremap <leader>wk <c-w>k
nnoremap <leader>wl <c-w>l
" Normal mode:
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l
" Insert mode:
inoremap <M-h> <Esc><c-w>h
inoremap <M-j> <Esc><c-w>j
inoremap <M-k> <Esc><c-w>k
inoremap <M-l> <Esc><c-w>l
" Visual mode:
vnoremap <M-h> <Esc><c-w>h
vnoremap <M-j> <Esc><c-w>j
vnoremap <M-k> <Esc><c-w>k
vnoremap <M-l> <Esc><c-w>l
""------------------------------------------------------------------------------
" Command-mode related
"for easily invoke up command_window
cnoremap <C-o> <C-f>
cnoremap <C-w> <C-f>

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
" type %% on Vim’s : command-line prompt, it automatically expands to the path of the active buffer,
" :edit %%, :read %%, :write %%save %%, saveas %%.
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

"------------------------------------------------------------------------------
" TODO:
" terminal emulation
if g:vim_bootstrap_editor == 'nvim'
  nnoremap <silent> <leader>ts :split term://zsh<CR>
  " map common commands run in terminal.
  " nnoremap <silent> <leader>sz :terminal top<CR>
  nnoremap <silent> <leader>tv :vsplit term://zsh<CR>
elseif v:version >= 800
  nnoremap <silent> <leader>ts :terminal <CR>
  nnoremap <silent> <leader>tv :vertical terminal<CR>
endif

" only work with nvim
if has('nvim')
    autocmd TermOpen term://* startinsert
    autocmd TermOpen setlocal statusline=%{b:term_title}

    if executable('nvr')
        " get a new window for inserting the commit message instead of a nested nvim process
        let $GIT_EDITOR="nvr -cc split --remote-wait +'set bufhidden=wipe'"
        " let $GIT_EDITOR="nvr --remote-wait +'set bufhidden=wipe'"
        " git waits for nvr to finish, so make sure to delete the buffer after saving the commit message: :w | bd.
        " don't like using :w | bd and prefer the good old :wq (or :x)
        autocmd FileType gitcommit,gitrebase,gitconfig set bufhidden=delete
    endif
endif

" To map <Esc> to exit terminal-mode:
tnoremap <Esc> <C-\><C-n>
tnoremap <M-[> <Esc>
" <C-v> means Verbatim.
" <C-v><Esc> send an Escape key to the program running inside the terminal buffer.
tnoremap <C-v><Esc> <Esc>
" To simulate |i_CTRL-R| in terminal-mode:
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
"" Switching windows
" Terminal mode under neovim
tnoremap <M-h> <c-\><c-n><c-w>h
tnoremap <M-j> <c-\><c-n><c-w>j
tnoremap <M-k> <c-\><c-n><c-w>k
tnoremap <M-l> <c-\><c-n><c-w>l
"------------------------------------------------------------------------------
" Sessions
"------------------------------------------------------------------------------
" session management
let g:session_directory = "~/.session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

" Define what to save with :mksession
" blank - empty windows
" buffers - all buffers not only ones in a window
" curdir - the current directory
" folds - including manually created ones
" help - the help window
" options - all options and mapping
" winsize - window sizes
" tabpages - all tab pages
" slash and unix - share session file between unix and windows
set sessionoptions=blank,buffers,curdir,folds,help,options,winsize,tabpages,slash,unix

" Remember things between sessions
"
" '20  - remember marks for 20 previous files
" \"50 - save 50 lines for each register
" :20  - remember 20 items in command-line history
" /20  - remember 20 items in search history
" %    - remember the buffer list (if vim started without a file arg)
" n    - set name of viminfo file
" set viminfo='20,\"50,:20,/20,%,n~/.viminfo.go

" Remember info about open buffers on close
" set viminfo^=%

nnoremap <leader>so :OpenSession<Space>
" save(write) session
nnoremap <leader>sw :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>
