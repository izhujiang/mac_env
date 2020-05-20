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
" plugin manager
let vimplug_exists = $VI_HOME .. '/autoload/plug.vim'
" nvim and vim use the same vimrc file
let $VI_CFG_DIR = expand('~/.config/nvim')

" *****************************************************************************
" Vim-PLug core
" ****************************************************************************

" Todo: Fixing bug with pyenv plz: ~/.pyenv/shims/python
" if(has("mac") || has("macunix"))
    " if filereadable(expand("~/.pyenv/shims/python3"))
    "     echo 'using python3: ~/.pyenv/shims/python3'
        " let g:python2_host_prog = '~/.pyenv/shims/python'
        " let g:python3_host_prog =  '~/.pyenv/shims/python3'
    " else
        " let g:python2_host_prog = '/usr/local/bin/python'
        " let g:python3_host_prog = '/usr/local/bin/python3'
    " endif
" elseif(has("unix"))
    " let g:python2_host_prog = '/usr/bin/python'
    " let g:python3_host_prog = '/usr/bin/python3'
" else
    " echo 'setting up python_host_prog plz'
" endif

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

call plug#begin(expand('$VI_HOME/plugged'))
    " execute 'source' vi_cfg_root .. '/plugins.vim'
    " or
    source $VI_CFG_DIR/plugins.vim
    ""*****************************************************************************
    "" Include user's extra bundle
    if filereadable(expand($VI_CFG_DIR .. '/local_bundles.vim'))
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
if filereadable(expand($VI_CFG_DIR .. '/local.vim'))
  source $VI_CFG_DIR/local.vim
endif
