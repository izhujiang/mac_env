augroup vimrc-java
    autocmd BufNewFile,BufRead *.gradle setf groovy
    autocmd FileType java setlocal omnifunc=javacomplete#Complete
    autocmd FileType java,groovy :execute "compiler gradle"
augroup END

