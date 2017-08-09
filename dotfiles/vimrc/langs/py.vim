
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
let python_highlight_all=1
