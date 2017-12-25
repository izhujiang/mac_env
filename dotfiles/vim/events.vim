

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


" -------Python
" for python ide configure
" support PEP8 indent style
au BufNewFile,BufRead *.py
\ set tabstop=4 |
\ set softtabstop=4 |
\ set shiftwidth=4 |
\ set textwidth=79 |
\ set expandtab |
\ set fileformat=unix |
\ set smartindent  "  编写python代码时会使#(注释)自动回退到行首

" ------js/html/css
au BufNewFile,BufRead *.js,*.htm,*.html,*.css
\ set tabstop=2 |
\ set softtabstop=2 |
\ set shiftwidth=2
\ let g:user_emmet_install_global = 0
autocmd FileType html,css
\ EmmetInstall |
" let g:user_emmet_mode='n'    "only enable normal mode functions.
" let g:user_emmet_mode='inv'  "enable all functions, which is equal to
\ let g:user_emmet_mode='a'    "enable all function in all mode.

"-------Markdown
autocmd BufNewFile,BufReadPost *.md
\ set filetype=markdown
" let g:vim_markdown_folding_disabled = 1

" To fold in a style like python-mode
\ let g:vim_markdown_folding_style_pythonic = 1

" To prevent foldtext
\ let g:vim_markdown_override_foldtext = 0

\ let g:vim_markdown_folding_level = 6

" let g:vim_markdown_no_default_key_mappings = 1

" Allow for the TOC window to auto-fit when it's possible for it to shrink.
" It never increases its default size (half screen), it only shrinks.
\ let g:vim_markdown_toc_autofit = 1

" By default text emphasis works across multiple lines until a closing token is found.
" However, it's possible to restrict text emphasis to a single line
" (ie, for it to be applied a closing token must be found on the same line)
" let g:vim_markdown_emphasis_multiline = 0

" Syntax Concealing
" For example, conceal [link text](link url) as just link text.
" Also, _italic_ and *italic* will conceal to just italic.
" Similarly __bold__, **bold**, ___italic bold___, and ***italic bold*** will conceal to
" just bold, bold, italic bold, and italic bold respectively.
" To enable conceal use Vim's standard conceal configuration.
\ set conceallevel=2
" To disable conceal regardless of conceallevel setting
"let g:vim_markdown_conceal = 0
" To disable math conceal with LaTeX math syntax enabled
"let g:tex_conceal = ""
autocmd BufWritePost *.md,*.markdown :silent !cat %:p | curl -X PUT -T - http://localhost:8090/
" set shell=bash\ -i
" " This will cause vim-instant-markdown to only refresh on the following events:
" " -No keys have been pressed for a while
" " -A while after you leave insert mode
" " -You save the file being edited
" let g:instant_markdown_slow = 1
" " By default, vim-instant-markdown will automatically launch the preview window when you open a markdown file.
" " let g:instant_markdown_autostart = 0
"
" " By default, the server only listens on localhost. To make the server available to others in your network
" " Only use this setting on trusted networks!
" " let g:instant_markdown_open_to_the_world = 1
"
" " By default, external resources such as images, stylesheets, frames and plugins are allowed. To block such content
" " let g:instant_markdown_allow_external_content = 0
let g:vim_markdown_math = 1

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

