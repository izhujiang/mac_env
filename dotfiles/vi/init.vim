" has("vim_starting") returns true on startup, false when running
" if has('vim_starting')
set nocompatible               " Be iMproved
" endif

" let g:vim_bootstrap_langs = 'go,html,javascript,typescript,python,scala'

" let vimplug_exists
if has('nvim')
  let g:vim_bootstrap_editor = 'nvim'
  let $VI_HOME = expand('~/.config/nvim')
else
  let g:vim_bootstrap_editor = "vim"
  let $VI_HOME = expand('~/.vim')
endif

  let $VI_CFG_DIR = expand('~/.config/nvim')
" plugin manager
let vimplug_exists = expand('$VI_HOME/autoload/plug.vim')
" nvim and vim use the same vimrc file

" *****************************************************************************
" Vim-PLug core
" ****************************************************************************
if has('nvim')
    let python3_exe = expand('$HOMEBREW/bin/python3')
    if filereadable(python3_exe)
      let g:loaded_python_provider = 0
      " Command to start Python3. Setting this makes startup faster.
      " Useful for working with virtualenvs. Must be set before any check for has("python3").
      let g:python3_host_prog = python3_exe
    endif

    let node_exe = expand('$HOMEBREW/bin/node')
    if filereadable(node_exe)
      " Command to start node.js. Setting this makes startup faster.
      let g:node_host_prog = node_exe
    endif

    let g:loaded_perl_provider = 0

    " TODO: Clipboard integration 			      *provider-clipboard* *clipboard*
endif

echo vimplug_exists
if !filereadable(vimplug_exists)
  if !executable('curl')
    echoerr 'You have to install curl or first install vim-plug yourself!'
    execute 'q!'
  endif

  echo "Installing Vim-Plug...\n"

  silent !\curl -fLo ${VI_HOME}/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = 'yes'

  autocmd VimEnter * PlugInstall
endif


" Enable matchit plugin shiped with vim
runtime macros/matchit.vim

call plug#begin(expand('$VI_CFG_DIR/plugged'))
    " execute 'source' vi_cfg_root .. '/plugins.vim'
    " or
    source $VI_CFG_DIR/plugins.vim
    ""*****************************************************************************
    "" Include user's extra bundle
    if filereadable(expand('$VI_CFG_DIR/local_bundles.vim'))
        source $VI_CFG_DIR/local_bundles.vim
    endif
call plug#end()

source $VI_CFG_DIR/general.vim
source $VI_CFG_DIR/plugins/ui.vim
source $VI_CFG_DIR/plugins/explorer.vim
source $VI_CFG_DIR/plugins/coding.vim
source $VI_CFG_DIR/plugins/langs.vim
source $VI_CFG_DIR/plugins/misc.vim

"*****************************************************************************
"
"" Include user's local vim config
if filereadable(expand('$VI_HOME/local.vim'))
  source $VI_CFG_DIR/local.vim
endif
