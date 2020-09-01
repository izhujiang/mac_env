if has('nvim')
    " let python3_exe = expand('$HOMEBREW/bin/python3')
    let python3_exe = system('which python3')
    if filereadable(python3_exe)
      let g:loaded_python_provider = 0
      " Command to start Python3. Setting this makes startup faster.
      " Useful for working with virtualenvs. Must be set before any check for has("python3").
      let g:python3_host_prog = python3_exe
    endif

    " let node_exe = expand('$HOMEBREW/bin/node')
    let node_exe = system('which node')
    if filereadable(node_exe)
      " Command to start node.js. Setting this makes startup faster.
      let g:node_host_prog = node_exe
    endif

    let g:loaded_perl_provider = 0

    " TODO: Clipboard integration 			      *provider-clipboard* *clipboard*
endif
