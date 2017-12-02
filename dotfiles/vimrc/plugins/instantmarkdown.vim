autocmd BufWritePost *.md,*.markdown :silent !cat %:p | curl -X PUT -T - http://localhost:8090/
" set shell=bash\ -i
" " This will cause vim-instant-markdown to only refresh on the following events:
" " -No keys have been pressed for a while
" " -A while after you leave insert mode
" " -You save the file being edited
" let g:instant_markdown_slow = 1
" 
" 
" " By default, vim-instant-markdown will automatically launch the preview window when you open a markdown file.
" " let g:instant_markdown_autostart = 0
" 
" " By default, the server only listens on localhost. To make the server available to others in your network
" " Only use this setting on trusted networks!
" " let g:instant_markdown_open_to_the_world = 1
" 
" " By default, external resources such as images, stylesheets, frames and plugins are allowed. To block such content
" " let g:instant_markdown_allow_external_content = 0
