
"------------------------------------------------------------------------------
" Files
"------------------------------------------------------------------------------
" Fast saving
map <Leader>w :w<CR>

" :W sudo saves the file
" (useful for handling the permission-denied error)
" command W w !sudo tee % > /dev/null

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>
" 正向跳转至下一个更改的开始。
map ]] ]c
map [[ [c

"------------------------------------------------------------------------------
" Buffers, Windows and Tabs
" A buffer is the in-memory text of a file.
" A window is a viewport on a buffer.
" A tab page is a collection of windows.
"------------------------------------------------------------------------------

" --buffers
" Close the current buffer (w/o closingthe currentwindow)
nnoremap bd :bdelete<cr>

" Close all the buffers
nnoremap <leader>bda :1,1000 bd!<cr>

" --tabs
" -------------------------------------------------------
" Useful mappings for managing tabs
noremap tn :tabnew<Space>
" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
nnoremap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
nnoremap tc :tabclose<CR>
nnoremap tm :tabmove<CR>
" move tabs
nnoremap tj :tabnext<CR>
nnoremap tk :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>
"通过ctrl h/l切换标签等
nnoremap <C-l> gt
nnoremap <C-h> gT
nnoremap <leader>te : tabe<CR>


" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>



" --windows
nnoremap wj <C-W>j
nnoremap wk <C-W>k
nnoremap wh <C-W>h
nnoremap wl <C-W>l


"------------------------------------------------------------------------------
" Insert mode related
"------------------------------------------------------------------------------
" This is totally awesome - remap jj to escape in insert mode.  You'll never type jj anyway, so it's great!
inoremap jj <esc>



"------------------------------------------------------------------------------
" Visual mode related
"------------------------------------------------------------------------------

" visual shifting (does not exit Visual mode)
" easyly moving of code blocks in visual mode
vnoremap < <gv
vnoremap > >gv

"------------------------------------------------------------------------------
" Search, Replace and Highlight
"------------------------------------------------------------------------------
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :nohlsearch<cr>

"------------------------------------------------------------------------------
" Spell checking
"------------------------------------------------------------------------------

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"------------------------------------------------------------------------------
" QuickFix
"------------------------------------------------------------------------------
"
" Do :help cope if you are unsure what cope is. It's super useful!
" To go to the next search result do:
"   <leader>n
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>


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
"---Golang
"---vim-go settings
au FileType go nmap gs (go-implements)
au FileType go nmap gi (go-info)
au FileType go nmap gd (go-doc)
au FileType go nmap gv (go-doc-vertical)
au FileType go nmap gr (go-run)
au FileType go nmap gb (go-build)
au FileType go nmap gt (go-test)
au FileType go nmap gc (go-coverage)
au FileType go nmap gds (go-def-split)
au FileType go nmap gdv (go-def-vertical)
au FileType go nmap gdt (go-def-tab)
au FileType go nmap gre (go-rename)


"------------------------------------------------------------------------------
" Plugins
"------------------------------------------------------------------------------
"
" ---NERDTree
" Toogle on/off
map <F2> :NERDTreeToggle<CR>
" Locate file in hierarchy quickly
map <leader>T :NERDTreeFind<cr>

" ---Tagbar
nmap <F8> :TagbarToggle<CR>

" ---Fugitive
"map <leader>gdi :Gdiff<cr>
"map <leader>gst :Gstatus<cr>
"map <leader>gdu :diffupdate<cr>
nnoremap gdi :Gdiff<cr>
nnoremap gst :Gstatus<cr>
nnoremap gdu :diffupdate<cr>


" ---YCM--------------
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"    "回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"


nnoremap <leader>g :YcmCompleter GoTo<CR> " 跳转到定义处
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>    "force recomile with syntastic
nnoremap  <F4> :YcmDiags<CR>

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

