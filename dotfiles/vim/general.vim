"------------------------------------------------------------------------------
" General
"------------------------------------------------------------------------------

" Enable filetype plugins
filetype plugin indent on    " required

" Rebind <Leader> key, with a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ','
" mapping the reverse character search command to another key.
noremap \ ,

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

"------------------------------------------------------------------------------
" Sessions
"------------------------------------------------------------------------------

let g:session_autoload = 'no'
let g:session_autosave = 'no'

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

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

"------------------------------------------------------------------------------
" Files
"------------------------------------------------------------------------------
set autoread                "reload file when modified out of vim
" Use Unix as the standard file type
set ffs=unix,mac,dos

if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
""  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=utf-8,gbk
endif


" Disable backup and swap files because of trigger too many events
" for tfile system watchers
set nobackup
set nowritebackup
set noswapfile

" writes the content of the file automatically if you call :make.   vim-go also makes use of this setting.
set autowrite

" Fast saving
nnoremap <Leader>w :w<CR>
nnoremap <Leader>x :x<CR>
" write file with sudo when open file readonly
cmap sw w !sudo tee >/dev/null %
" Switch CWD to the directory of the open buffer
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>



"------------------------------------------------------------------------------
" Editing
"------------------------------------------------------------------------------
set clipboard=unnamed
set nopaste

" Don't redraw while executing macros, register and other command without
" through input (good performance config)
set lazyredraw

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

" Completion options (select longest + show menu even if a single match is found)
set completeopt=longest,menu    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
" Set command-line completion mode

set wildmode=list:longest,full
set whichwrap+=<,>,h,l

" Enable Ctrl-A/Ctrl-X to work on octal and hex numbers, as well as characters
set nrformats=octal,hex,alpha

"------------------------------------------------------------------------------
" This is totally awesome - remap jj to escape in insert mode.  You'll never type jj anyway, so it's great!
" inoremap jj <esc>

" move to begin and end of line
noremap <C-h> ^
noremap <C-l> $

" inoremap <C-k> <Up>
" inoremap <C-j> <Down>

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
" Close the current buffer (w/o closingthe currentwindow)
nnoremap <leader>bd :bdelete<cr>

" Close all the buffers
nnoremap <leader>bda :1,1000 bd!<cr>

autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" tabs
" Useful mappings for managing tabs
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
nnoremap <leader>te : tabe<CR>

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>

 autocmd TabLeave * let g:lasttab = tabpagenr()

" --windows
" splite at specific region
set splitbelow
set splitright

nnoremap <leader>wj <C-W>j
nnoremap <leader>wk <C-W>k
nnoremap <leader>wh <C-W>h
nnoremap <leader>wl <C-W>l
nnoremap <leader>q <C-W>q

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
let g:molokai_original = 1
colorscheme molokai


" Highlight current line - allows you to track cursor position more easily
set cursorline

" Show line, column number, and relative position within a file in the status line
set ruler

" Show line numbers - could be toggled on/off on-fly by pressing F6
set number
set relativenumber

" --folding
set foldmethod=syntax       "代码折叠
set foldlevel=10
set foldnestmax=10

" Enable folding with the spacebar
nnoremap <space> za


" --tab
" Use spaces instead of tabs
set expandtab
" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set tabstop=4
set shiftwidth=4
" Round indent to multiple of 'shiftwidth' for > and < commands
set shiftround
" tab equals to 4 spaces
set softtabstop=4

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
" vnoremap < <gv
" vnoremap > >gv

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" Disable highlight when <leader><cr> is pressed
nnoremap <silent> <leader><cr> :nohlsearch<cr>


" highlight trailing space
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

"------------------------------------------------------------------------------
" Fast movement
"------------------------------------------------------------------------------
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
" Command mode related
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

" Quickly open a buffer for scribble
" map <leader>q :e ~/buffer<cr>


" Quickly open a markdown buffer for scribble
" map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>
"------------------------------------------------------------------------------
" Langs
"------------------------------------------------------------------------------
augroup configgroup
    autocmd!
    "" -------Python
    " for python ide configure
    au BufNewFile,BufRead *.py
    \ set textwidth=79 |
    " expandtab turns <TAB>s into spaces.
    \ set expandtab |
    \ set foldmethod=indent |  " fold based on indent level
    \ set fileformat=unix |
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd FileType python nnoremap <F5> :!python %<CR>
    " confused: <localleader>r does work while <leader>r doesn't in case of pipenv.
    " <leader>r runs the python of system instead of the current pipenv shell
"    autocmd FileType python nnoremap <leader>r :!python %<CR>
"    autocmd FileType python nnoremap <localleader>r :!python %<CR>

    au BufNewFile,BufRead *.go
    \ set noexpandtab |
    " "\ set fileformat=unix

    " ------js/html/css
    au BufNewFile,BufRead *.js,*.htm,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

    autocmd BufNewFile,BufRead *.gradle setf groovy

    autocmd FileType java setlocal omnifunc=javacomplete#Complete
    autocmd FileType java,groovy :execute "compiler gradle"

    autocmd BufWrite *.go :call DeleteTrailingWS()
    autocmd BufWrite *.py :call DeleteTrailingWS()
    autocmd BufWrite *.coffee :call DeleteTrailingWS()

augroup END
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


" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
