" " vim-go custom mappings
au FileType go nmap s (go-implements)
au FileType go nmap i (go-info)
au FileType go nmap gd (go-doc)
au FileType go nmap gv (go-doc-vertical)
au FileType go nmap r (go-run)
au FileType go nmap b (go-build)
au FileType go nmap t (go-test)
au FileType go nmap c (go-coverage)
au FileType go nmap ds (go-def-split)
au FileType go nmap dv (go-def-vertical)
au FileType go nmap dt (go-def-tab)
au FileType go nmap e (go-rename)

" vim-go settings
let g:go_fmt_command = "goimports"
