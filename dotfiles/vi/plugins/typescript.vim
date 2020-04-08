" walk around built-in custom indenter
let g:typescript_indent_disable = 1

let g:typescript_opfirst='\%([<>=,?^%|*/&]\|\([-:+]\)\1\@!\|!=\|in\%(stanceof\)\=\>\)'


" compiler setting
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''

autocmd FileType typescript :set makeprg=tsc
" to make the QuickFix window automatically appear if :make has any errors.
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" Syntax highlighting
" When this variable is defined, doccomments will not be highlighted.
" let g:typescript_ignore_typescriptdoc = 0
"  When this variable is set to 1, browser API names such as window or document will not be highlighted. (default to 0)
" let g:typescript_ignore_browserwords = 0
