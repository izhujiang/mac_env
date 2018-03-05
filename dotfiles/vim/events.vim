"------------------------------------------------------------------------------
" Reading
"------------------------------------------------------------------------------
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

"------------------------------------------------------------------------------
" Writing
"------------------------------------------------------------------------------
autocmd BufWrite *.go :call DeleteTrailingWS()
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

"------------------------------------------------------------------------------
" Buffers
"------------------------------------------------------------------------------
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

"------------------------------------------------------------------------------
" Tabs
"------------------------------------------------------------------------------
 autocmd TabLeave * let g:lasttab = tabpagenr()

"------------------------------------------------------------------------------
" Insert mode
"------------------------------------------------------------------------------
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/

"------------------------------------------------------------------------------
" Langs
"------------------------------------------------------------------------------
" instant-markdown fresh the doc
" autocmd BufWritePost *.md,*.markdown :silent !cat %:p | curl -X PUT -T - http://localhost:8090/
"
"------------------------------------------------------------------------------
" Plugins
"------------------------------------------------------------------------------
" --NERDTree
" Open NERDTree on startup, when no file has been specified
" autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" -- YCM
" YCM settings
autocmd InsertLeave * if pumvisible() != 0|pclose|endif    "离开插入模式后自动关闭预览窗口

"------------------------------------------------------------------------------
" Helper functions
"------------------------------------------------------------------------------

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
