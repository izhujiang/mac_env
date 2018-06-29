" vim-javascript settings
" https://github.com/pangloss/vim-javascript

" Enables syntax highlighting for JSDocs
let g:javascript_plugin_jsdoc = 1
" Enables some additional syntax highlighting for NGDocs. Requires JSDoc plugin to be enabled as well.
" let g:javascript_plugin_ngdoc = 1

"  Enables syntax highlighting for Flow.
let g:javascript_plugin_flow = 1

" conceal key words into glyph if you want to customize concealing characters
" set conceallevel=2
" let g:javascript_conceal_function             = 'ƒ'
" let g:javascript_conceal_null                 = 'ø'
" let g:javascript_conceal_this                 = '@'
" let g:javascript_conceal_return               = '⇚'
" let g:javascript_conceal_undefined            = '¿'
" let g:javascript_conceal_nan                  = 'ℕ'
" let g:javascript_conceal_prototype            = '¶'
" let g:javascript_conceal_static               = '•'
" let g:javascript_conceal_super                = 'Ω'
" let g:javascript_conceal_arrow_function       = '⇒'
" let g:javascript_conceal_noarg_arrow_function = '🞅'
" let g:javascript_conceal_underscore_arrow_function = '🞅'

" augroup javascript_folding
"     au!
"     au FileType javascript setlocal foldmethod=syntax
" augroup END
