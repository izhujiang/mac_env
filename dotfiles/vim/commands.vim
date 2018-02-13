
"------------------------------------------------------------------------------
" Files
"------------------------------------------------------------------------------
" Fast saving
nnoremap <Leader>w :w<CR>

" :W sudo saves the file
" (useful for handling the permission-denied error)
" command W w !sudo tee % > /dev/null

" Switch CWD to the directory of the open buffer
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>
" 正向跳转至下一个更改的开始。
nnoremap ]] ]c
nnoremap [[ [c

"------------------------------------------------------------------------------
" Buffers, Windows and Tabs
" A buffer is the in-memory text of a file.
" A window is a viewport on a buffer.
" A tab page is a collection of windows.
"------------------------------------------------------------------------------

" --buffers
" move between buffers
nnoremap <leader>bj :bnext<cr>
nnoremap <leader>bk :bprevious<cr>
nnoremap <leader>bh :bfirst<cr>
nnoremap <leader>bl :blast<cr>
" Close the current buffer (w/o closingthe currentwindow)
nnoremap bd :bdelete<cr>

" Close all the buffers
nnoremap <leader>bda :1,1000 bd!<cr>

" --tabs
" -------------------------------------------------------
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
"通过ctrl h/l切换标签等
nnoremap <C-l> gt
nnoremap <C-h> gT
nnoremap <leader>te : tabe<CR>

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>

" --windows
nnoremap <leader>wj <C-W>j
nnoremap <leader>wk <C-W>k
nnoremap <leader>wh <C-W>h
nnoremap <leader>wl <C-W>l

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
nnoremap <silent> <leader><cr> :nohlsearch<cr>

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
nmap <leader>lv :lv /<c-r>=expand("<cword>")<cr>/ %<cr>:lw<cr>
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

" ------------------------------------------------------------------------------
" Langs
" ------------------------------------------------------------------------------
" General programming options
" Enable folding with the spacebar
nnoremap <space> za

" -------C/C++
" using <leader><space> shortcut to make c/c++ file is supercool
autocmd FileType c,cpp
\ map <buffer> <leader><space> :w<cr>:make<cr>
" It's super useful!
\ nmap <leader>cw :cw 10<cr>
" To go to the next search result do:
\ map <leader>cn :cn<cr>
" To go to the previous search results do:
\ map <leader>cp :cp<cr>
\ map <leader>cc :botright cope<cr>
\ map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
":cc               show detail error info
":cp               jump to preview error
":cn               jump to next error
":cl               list all errors
":cw               show error window(quickfix) when errors exist
":col              get older error list
":cnew             get newer error list

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

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" ---Fugitive
"map <leader>gdi :Gdiff<cr>
"map <leader>gst :Gstatus<cr>
"map <leader>gdu :diffupdate<cr>
nnoremap gdi :Gdiff<cr>
nnoremap gst :Gstatus<cr>
nnoremap gdu :diffupdate<cr>

" ----python-mode----

" " --Vim motion
" " support Vim motion (See operator) for python objects (such as functions,
" " class and methods).
" " C — means class
" " M — means method or function
" "
" " ================  ============================
" " Key               Command
" " ================  ============================
" " [[                Jump to previous class or function (normal, visual, operator modes)
" " ]]                Jump to next class or function  (normal, visual, operator modes)
" " [M                Jump to previous class or method (normal, visual, operator modes)
" " ]M                Jump to next class or method (normal, visual, operator modes)
" " aC                Select a class. Ex: vaC, daC, yaC, caC (normal, operator modes)
" " iC                Select inner class. Ex: viC, diC, yiC, ciC (normal, operator modes)
" " aM                Select a function or method. Ex: vaM, daM, yaM, caM (normal, operator modes)
" " iM                Select inner function or method. Ex: viM, diM, yiM, ciM (normal, operator modes)
" " ================  ============================
" 
" " Show documentation
" " :PymodeDoc <args> — show documentation 
" " Bind keys to show documentation for current word (selection)
" let g:pymode_doc_bind = 'K'
" 
" " Support virtualenv
" " Commands:
" " :PymodeVirtualenv <path> -- Activate virtualenv (path can be absolute or
" 
" " --Run code
" " :PymodeRun -- Run current buffer or selection
" let g:pymode_run_bind = '<leader>r'
" let g:pymode_breakpoint_bind = '<leader>b'
" " Manually set breakpoint command (leave empty for automatic detection)
" let g:pymode_breakpoint_cmd = ''
" 
" " --Code checking
" " Pymode supports pylint, pep257, pep8, pyflakes, mccabe code
" " checkers. You could run several similar checkers.
" " Commands:
" " :PymodeLint -- Check code in current buffer
" " :PymodeLintToggle -- Toggle code checking
" " :PymodeLintAuto -- Fix PEP8 errors in current buffer automatically
" 
" " --Rope support 
" " Commands:
" " :PymodeRopeAutoImport -- Resolve import for element under cursor
" " :PymodeRopeModuleToPackage -- Convert current module to package
" " :PymodeRopeNewProject -- Open new Rope project in current working directory
" " :PymodeRopeRegenerate -- Regenerate the project cache
" " :PymodeRopeRenameModule -- Rename current module
" " :PymodeRopeUndo -- Undo changes from last refactoring
" " :PymodeRopeRedo -- Redo changes from last refactoring
" 
" let g:pymode_rope_show_doc_bind = '<C-c>d'
" let g:pymode_rope_completion_bind = '<C-Space>'
" let g:pymode_rope_goto_definition_bind = '<C-c>g'
" 
" let g:pymode_rope_rename_bind = '<C-c>rr'
" let g:pymode_rope_rename_module_bind = '<C-c>r1r'
" let g:pymode_rope_organize_imports_bind = '<C-c>ro'
" let g:pymode_rope_autoimport_bind = '<C-c>ra'
" let g:pymode_rope_module_to_package_bind = '<C-c>r1p'
" let g:pymode_rope_extract_method_bind = '<C-c>rm'
" let g:pymode_rope_extract_variable_bind = '<C-c>rl'
" let g:pymode_rope_use_function_bind = '<C-c>ru'
" let g:pymode_rope_move_bind = '<C-c>rv'
" let g:pymode_rope_change_signature_bind = '<C-c>rs'

" ---YCM--------------
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"    "回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"


" let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
" let g:ycm_key_list_accept_completion = ['<C-y>']
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']
" let g:ycm_key_list_stop_completion = ['<C-y>']

let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_key_list_stop_completion = ['<enter>']

let g:ycm_key_detailed_diagnostics = '<leader>d'

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

