"------------------------------------------------------------------------------
" General
"------------------------------------------------------------------------------
" Enable filetype plugins
filetype plugin indent on    " required

" define specific file type
autocmd BufRead,BufNewFile *.tsx		:set filetype=typescript

" Encoding
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
""  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=utf-8,gbk
endif

" Rebind <Leader> key, with a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ','
" mapping the reverse character search command to another key.
noremap \ ,

" This is totally awesome - remap jj to escape in insert mode.  You'll never type jj anyway, so it's great!
" inoremap jj <esc>

" Disable arrowskeys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

" set helplang=cn             "help file in chinese

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

nnoremap <Leader>q :q<CR>
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

" session management
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

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

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

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

" Fast saving
nnoremap <Leader>w :w<CR>
nnoremap <Leader>x :x<CR>
" write file with sudo when open file readonly
cmap sw w !sudo tee >/dev/null %

" Switch CWD to the directory of the open buffer
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>
"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

"------------------------------------------------------------------------------
" Editing
"------------------------------------------------------------------------------
set clipboard=unnamed
set nopaste

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Don't redraw while executing macros, register and other command without
" through input (good performance config)
set lazyredraw

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

" Completion options (select longest + show menu even if a single match is found)
set completeopt=longest,menu
" Set command-line completion mode

set wildmode=list:longest,full
set whichwrap+=<,>,h,l

" Enable Ctrl-A/Ctrl-X to work on octal and hex numbers, as well as characters
set nrformats=octal,hex,alpha

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif
if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif


"------------------------------------------------------------------------------
" Buffers, Windows and Tabs
" A buffer is the in-memory text of a file.
" A window is a viewport on a buffer.
" A tab page is a collection of windows.
"------------------------------------------------------------------------------
" --buffers
" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set showtabline=2
catch
endtry
" move between buffers
nnoremap <leader>bj :bnext<cr>
nnoremap <leader>bk :bprevious<cr>
nnoremap <leader>bh :bfirst<cr>
nnoremap <leader>bl :blast<cr>
" Close the current buffer (w/o closing the currentwindow)
nnoremap <leader>bd :bdelete<cr>
" Close all the buffers
nnoremap <leader>bc :1,1000 bd!<cr>

autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" tabs
" Useful mappings for managing tabs
"" Tabs
" nnoremap <Tab> gt
" nnoremap <S-Tab> gT

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
nnoremap <leader>te :tabedit<CR>

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
 autocmd TabLeave * let g:lasttab = tabpagenr()

" --windows
" splite at specific region
set splitbelow
set splitright

noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Switching windows
" Terminal mode under neovim
tnoremap <M-h> <c-\><c-n><c-w>h
tnoremap <M-j> <c-\><c-n><c-w>j
tnoremap <M-k> <c-\><c-n><c-w>k
tnoremap <M-l> <c-\><c-n><c-w>l
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
" Normal mode:
nnoremap <M-h> <c-w>h
nnoremap <M-j> <c-w>j
nnoremap <M-k> <c-w>k
nnoremap <M-l> <c-w>l

"------------------------------------------------------------------------------
" Editor UI
"------------------------------------------------------------------------------
" --Colors and Fonts
" set background=dark
" colorscheme vim-material

" set background=dark
" let g:solarized_termcolors=256
" colorscheme solarized

let g:rehash256 = 1
" prefer the scheme to match the original monokai background color, otherwith comment it.
" let g:molokai_original = 1
" colorscheme molokai

" Highlight current line - allows you to track cursor position more easily
set cursorline

" Show line, column number, and relative position within a file in the status line
set ruler

" Show line numbers - could be toggled on/off on-fly by pressing F6
set number
set relativenumber


"" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

" --folding
set foldmethod=syntax       "代码折叠
set foldlevel=10
set foldnestmax=10

" Enable folding with the spacebar
nnoremap <space> za

"" Tabs. May be overriten by autocmd rules
set tabstop=4
" tab equals to 4 spaces
set softtabstop=0
set shiftwidth=4

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

" Make sure that extra margin on left is removed
set foldcolumn=0

"------------------------------------------------------------------------------
" Search, Replace and Highlight
"------------------------------------------------------------------------------
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

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>


" visual shifting (does not exit Visual mode)
" easyly moving of code blocks in visual mode, not good, break the rule of dot command
vnoremap < <gv
vnoremap > >gv
"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv


" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" Disable highlight when <leader><cr> is pressed
nnoremap <silent> <leader><cr> :nohlsearch<cr>
"" Clean search (highlight)
nnoremap <silent> <leader><space> :nohlsearch<cr>


" highlight trailing space
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

"------------------------------------------------------------------------------
" Fast movement
"------------------------------------------------------------------------------
"------------------------------------------------------------------------------
" move to begin and end of line
noremap <C-h> ^
noremap <C-l> $

" 正向跳转至下一个更改的开始。
nnoremap ]] ]c
nnoremap [[ [c

"------------------------------------------------------------------------------
" Status line
"------------------------------------------------------------------------------
" Always show the status line
set laststatus=2
" Show (partial) commands (or size of selection in Visual mode) in the status line
set showcmd
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\


"------------------------------------------------------------------------------
" Spell checking
"------------------------------------------------------------------------------

" Pressing ,ss will toggle and untoggle spell checking
nnoremap <leader>ss :setlocal spell!<cr>

" shortcuts using <leader>
nnoremap <leader>sn ]s
nnoremap <leader>sp [s
nnoremap <leader>sa zg
nnoremap <leader>s? z=

"------------------------------------------------------------------------------
" QuickFix
"------------------------------------------------------------------------------
" It's super useful!
nnoremap <leader>cw :cw 20<cr>
nnoremap <leader>lv :lv /<c-r>=expand("<cword>")<cr>/ %<cr>:lw<cr>

" To go to the next search result do:
nnoremap <leader>cn :cn<cr>
" To go to the previous search results do:
nnoremap <leader>cp :cp<cr>

nnoremap <leader>cc :botright copen<cr>

""------------------------------------------------------------------------------
" Command-mode related
"------------------------------------------------------------------------------
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
" type %% on Vim’s : command-line prompt, it automatically expands to the path of the active buffer,
" :edit %%, :read %%, :write %%save %%, saveas %%.
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

"------------------------------------------------------------------------------
" Misc
"------------------------------------------------------------------------------

" Remove the Windows ^M - when the encodings gets messed up
" noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm


"" Remember cursor position
augroup vim-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" txt
augroup vim-text
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=79
  endfunction
endif

"------------------------------------------------------------------------------
" Insert mode
"------------------------------------------------------------------------------
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
"------------------------------------------------------------------------------
" Helper functions
"------------------------------------------------------------------------------
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
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
