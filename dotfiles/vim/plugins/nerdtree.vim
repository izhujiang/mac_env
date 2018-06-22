
" -----NERDTree-------------------------------------------
let NERDTreeWinPos='left'
let NERDTreeWinSize=30
let NERDTreeDirArrows=1
let NERDTreeMinimalUI=1
let NERDTreeIgnore=['\.o$', '\.pyc$', '\.php\~$','\~$']

" Toogle on/off
map <F2> :NERDTreeToggle<CR>
" Locate file in hierarchy quickly
map <leader>T :NERDTreeFind<cr>

" Open NERDTree on startup, when no file has been specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
