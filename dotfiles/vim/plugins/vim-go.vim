" ----Golong, vim-go settings
" Currently by default :GoDecls and :GoDeclsDir show type and function declarations.
let g:go_decls_includes = "func,type"

" The 'go to definition' command families are very powerful but yet easy to use.
" Under the hood it uses by default the tool guru.guru has an excellent track record of being very predictable.
" But sometimes it's very slow for certain queries.
" vim-go was using godef which is very fast on resolving queries.
let g:go_def_mode = 'guru'
" let g:go_def_mode = 'godef'

" let g:go_fmt_command = "gofmt" "Explicited the formater plugin (gofmt, goimports, goreturn...)
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1

"
" By default syntax-highlighting for Functions, Methods and Structs is disabled.
" Let's enable them!
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_fields = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
" let g:go_highlight_generate_tags = 1

" There are two types of error lists in Vim: location list and quickfix
" use only quickfix for Build, Check, Tests, et
let g:go_list_type = "quickfix"

" :GoMetaLinter for a given Go source code. By default it'll run go vet, golint and errcheck concurrently.
" gometalinter collects all the outputs and normalizes it to a common format.
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['golint']
let g:go_metalinter_deadline = "5s"

" :GoInfo, Identifier resolution
" vim-go has a support to automatically show the information whenever you move your cursor.
" let g:go_auto_type_info = 1
let g:go_auto_type_info = 0
" status line is updated automatically
" set updatetime=800

" :GoSameIds :GoSameIdsClear,and GoSameIdsToggle
" go_auto_sameids enabled by :GoSameIDsAutoToggle
let g:go_auto_sameids = 0

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

autocmd FileType go nmap <leader>gb :<C-u>call <SID>build_go_files()<CR>
" autocmd FileType go nmap <leader>gb  <Plug>(go-build)
autocmd FileType go nmap <leader>gr  <Plug>(go-run)
autocmd FileType go nmap <leader>gt <Plug>(go-test)
" autocmd FileType go nmap <leader>gc <Plug>(go-coverage)
autocmd FileType go nmap <leader>gc <Plug>(go-coverage-toggle)
autocmd FileType go nmap <leader>gm :GoMetaLinter<cr>


autocmd FileType go nmap <leader>ga :GoAlternate<cr>
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

autocmd FileType go nmap <leader>go <Plug>(go-implements)
autocmd FileType go nmap <leader>gi <Plug>(go-info)
" vim-go overrides the default normal shortcut K so that it invokes :GoDoc instead of man
autocmd FileType go nmap <leader>gd <Plug>(go-doc)
autocmd FileType go nmap <leader>gdvv <Plug>(go-doc-vertical)
autocmd FileType go nmap <leader>gs  :GoSameIdsToggle<cr>
" vim builtin gd shortcut for go_def?
autocmd FileType go nmap <leader>gds <Plug>(go-def-split)
autocmd FileType go nmap <leader>gdv <Plug>(go-def-vertical)
autocmd FileType go nmap <leader>gdt <Plug>(go-def-tab)

autocmd FileType go nmap <leader>gdf :GoDecls<cr>
autocmd FileType go nmap <leader>gdd :GoDeclsDir<cr>

autocmd FileType go nmap <leader>gn <Plug>(go-rename)

" mapping to <leader>gb
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
