"------------------------------------------------------------------------------
" General
"------------------------------------------------------------------------------

" let's make sure we are in noncompatble mode
set nocompatible              " required

" Enable filetype plugins
filetype plugin indent on    " required

" Rebind <Leader> key, with a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ','

" This is totally awesome - remap jj to escape in insert mode.  You'll never type jj anyway, so it's great!
inoremap jj <esc>


" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

set helplang=cn             "帮助系统设置为中文


"------------------------------------------------------------------------------
" Files
"------------------------------------------------------------------------------

set autoread                "文件在Vim之外修改过，自动重新读入

" Fast saving
map <Leader>w :w<CR>

" :W sudo saves the file
" (useful for handling the permission-denied error)
" command W w !sudo tee % > /dev/null


if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=utf-8,gbk
endif

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Disable backup and swap files because of trigger too many events
" for tfile system watchers
set nobackup
set nowritebackup
set noswapfile

set clipboard=unnamed
set nopaste


" Remember things between sessions
"
" '20  - remember marks for 20 previous files
" \"50 - save 50 lines for each register
" :20  - remember 20 items in command-line history
" /20  - remember 20 items in search history
" %    - remember the buffer list (if vim started without a file arg)
" n    - set name of viminfo file
set viminfo='20,\"50,:20,/20,%,n~/.viminfo.go

" Define what to save with :mksession
" blank - empty windows
" buffers - all buffers not only ones in a window
" curdir - the current directory
" folds - including manually created ones
" help - the help window
" options - all options and mapping
" winsize - window sizes
" tabpages - all tab pages
set sessionoptions=blank,buffers,curdir,folds,help,options,winsize,tabpages


"------------------------------------------------------------------------------
" VIM user interface
"------------------------------------------------------------------------------

" Don't redraw while executing macros, register and other command without
" through input (good performance config)
set lazyredraw


" add vertical lines on columns
" set colorcolumn=80,160

" Set command-line completion mode
set wildmode=list:longest,full

" Completion options (select longest + show menu even if a single match is found)
set completeopt=longest,menuone

" Highlight current line - allows you to track cursor position more easily
set cursorline

" Show line, column number, and relative position within a file in the status line
set ruler

" Show line numbers - could be toggled on/off on-fly by pressing F6
set number
set relativenumber

" Show (partial) commands (or size of selection in Visual mode) in the status line
set showcmd

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

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

" How many tenths of a second to blink when matching brackets
" set match=2


" highlight trailing space
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

set foldmethod=syntax       "代码折叠
set foldlevel=99

" Make sure that extra margin on left is removed
set foldcolumn=0
" Enable Ctrl-A/Ctrl-X to work on octal and hex numbers, as well as characters
" set nrformats=octal,hex,alpha

"------------------------------------------------------------------------------
" Colors and Fonts
"------------------------------------------------------------------------------

" Enable syntax highlighting
syntax enable

" set background=dark


"------------------------------------------------------------------------------
" Text, tab and indent related
"------------------------------------------------------------------------------

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
" Round indent to multiple of 'shiftwidth' for > and < commands
set shiftround

" Linebreak on 500 characters
set linebreak
set textwidth=500

set autoindent "Auto indent
set smartindent "Smart indent
set nowrap "Don't Wrap lines (it is stupid)

"conf for tabs, 为标签页进行的配置，通过ctrl h/l切换标签等
" nnoremap <C-l> gt
" nnoremap <C-h> gT
"  nnoremap <leader>t : tabe<CR>


" todo:
"------------------------------------------------------------------------------
" Visual mode related
"------------------------------------------------------------------------------

" easyly moving of code blocks in visual mode
vnoremap < <gv  
vnoremap > >gv

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv


"------------------------------------------------------------------------------
" Moving around, tabs, windows and buffers
"------------------------------------------------------------------------------

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :nohlsearch<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" splite at specific region
set splitbelow
set splitright


" Close the current buffer (w/o closingthe currentwindow)
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>bda :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>tj :tabnext
map <leader>tk :tabprevious

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set showtabline=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%


"------------------------------------------------------------------------------
" Status line
"------------------------------------------------------------------------------
" Always show the status line
set laststatus=2

" Format the status line
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l



"------------------------------------------------------------------------------
" Editing mappings
"------------------------------------------------------------------------------
"

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.go :call DeleteTrailingWS()
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()


" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv


"------------------------------------------------------------------------------
" Ack searching and cope displaying
" (requires ack.vim - it's much better than vimgrep/grep)
"------------------------------------------------------------------------------

" When you press gv you Ack after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

" Open Ack and put the cursor in the right position
map <leader>a :Ack<space>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with Ack, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>


"------------------------------------------------------------------------------
" Spell checking
"------------------------------------------------------------------------------

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


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

