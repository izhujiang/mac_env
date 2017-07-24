" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"




" solution from wincent (Greg Hurrell)
let s:expansion_active = 0

function! Setup_mappings()
  " Overwrite the mappings that UltiSnips sets up during expansion.
  execute 'inoremap <buffer> <silent> ' . g:UltiSnipsJumpForwardTrigger .
        \ ' <C-R>=Expand_or_jump("N")<CR>'
  execute 'snoremap <buffer> <silent> ' . g:UltiSnipsJumpForwardTrigger .
        \ ' <Esc>:call Expand_or_jump("N")<CR>'
  execute 'inoremap <buffer> <silent> ' . g:UltiSnipsJumpBackwardTrigger .
        \ ' <C-R>=Expand_or_jump("P")<CR>'
  execute 'snoremap <buffer> <silent> ' . g:UltiSnipsJumpBackwardTrigger .
        \ ' <Esc>:call Expand_or_jump("P")<CR>'

  " One additional mapping of our own: accept completion with <CR>.
  imap <expr> <buffer> <silent> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
  smap <expr> <buffer> <silent> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

  let s:expansion_active = 1
endfunction

function! Teardown_mappings()
  silent! iunmap <expr> <buffer> <CR>
  silent! sunmap <expr> <buffer> <CR>

  let s:expansion_active = 0
endfunction

let g:ulti_jump_backwards_res = 0
let g:ulti_jump_forwards_res = 0
let g:ulti_expand_res = 0

function! Expand_or_jump(direction)
  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res == 0
    " No expansion occurred.
    if pumvisible()
      " Pop-up is visible, let's select the next (or previous) completion.
      if a:direction == 'N'
        return "\<C-N>"
      else
        return "\<C-P>"
      endif
    else
      if s:expansion_active
        if a:direction == 'N'
          call UltiSnips#JumpForwards()
          if g:ulti_jump_forwards_res == 0
            " We did not jump forwards.
            return "\<Tab>"
          endif
        else
          call UltiSnips#JumpBackwards()
        endif
      else
        if a:direction == 'N'
          return "\<Tab>"
        endif
      endif
    endif
  endif

  " No popup is visible, a snippet was expanded, or we jumped, or we failed to
  " jump backwards, so nothing to do.
  return ''
endfunction

" YouCompleteMe and UltiSnips compatibility.
let g:UltiSnipsExpandTrigger = '<Tab>'
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'

" Prevent UltiSnips from removing our carefully-crafted mappings.
let g:UltiSnipsMappingsToIgnore = ['autocomplete']

if has('autocmd')
  augroup WincentAutocomplete
    autocmd!
    autocmd! User UltiSnipsEnterFirstSnippet
    autocmd User UltiSnipsEnterFirstSnippet call Setup_mappings()
    autocmd! User UltiSnipsExitLastSnippet
    autocmd User UltiSnipsExitLastSnippet call Teardown_mappings()
  augroup END
endif


