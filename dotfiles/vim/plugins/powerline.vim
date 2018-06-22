
" -----Powerline-----------------------------------------
"这个是安装字体后 必须设置此项"
let g:airline_powerline_fonts = 1
" let g:airline_theme='material'
let g:airline_theme='tomorrow'

"打开tabline功能,方便查看Buffer和切换，这个功能比较不错"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
