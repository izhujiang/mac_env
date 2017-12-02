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
"let g:vim_markdown_math = 1

