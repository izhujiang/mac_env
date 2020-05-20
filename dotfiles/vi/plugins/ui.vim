
"------------------------------------------------------------------------------
" molokai
" prefer the scheme to match the original monokai background color, otherwith comment it.
let g:rehash256 = 1
let g:molokai_original = 1

if has('nvim')
  if isdirectory(expand($HOME ."/.config/nvim/plugged/molokai"))
    colorscheme molokai
  endif
else
  if isdirectory(expand($HOME ."/.vim/plugged/molokai"))
    colorscheme molokai
  endif
endif

"------------------------------------------------------------------------------
" indentLine
" indentLine will overwrite your concealcursor and conceallevel with default value:
" You can customize these settings, but the plugin will not function if conceallevel is not set to 1 or 2.
" Disable by default and using IndentLinesToggle to walk around overwritting the conceallevel
let g:indentLine_enabled = 0
let g:indentLine_setConceal = 2

"------------------------------------------------------------------------------
" vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
if !exists('g:airline_powerline_fonts')
  let g:airline_powerline_fonts = 1
  " let g:airline_theme='material'
  " let g:airline_theme='tomorrow'
  let g:airline_theme = 'powerlineish'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
  let g:airline_skip_empty_sections = 1

  let g:airline#extensions#syntastic#enabled = 1
  let g:airline#extensions#tagbar#enabled = 1

  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#buffer_nr_show = 1
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline#extensions#branch#enabled = 1
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline#extensions#virtualenv#enabled = 1
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif
