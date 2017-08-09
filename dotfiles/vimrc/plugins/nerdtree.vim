" setting for NERDTree
" General properties
let NERDTreeWinPos='left'
let NERDTreeWinSize=30
let NERDTreeDirArrows=1
let NERDTreeMinimalUI=1
let NERDTreeIgnore=['\.o$', '\.pyc$', '\.php\~$','\~$']


" Open NERDTree on startup, when no file has been specified
autocmd VimEnter * if !argc() | NERDTree | endif

" Locate file in hierarchy quickly
map <leader>T :NERDTreeFind<cr>

" Toogle on/off
map <F2> :NERDTreeToggle<CR>

