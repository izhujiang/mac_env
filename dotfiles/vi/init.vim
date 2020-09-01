set nocompatible       " Be iMproved
let g:vim_bootstrap_langs = 'go,html,javascript,typescript,python,scala'

if has('nvim')
  let g:vim_bootstrap_editor = 'nvim'
  let $VI_HOME = expand('~/.config/nvim')
else
  let g:vim_bootstrap_editor = 'vim'
  let $VI_HOME = expand('~/.vim')
endif


" plugin manager
let vimplug_exists = expand('$VI_HOME/autoload/plug.vim')

" *****************************************************************************
" Vim-PLug core
" ****************************************************************************
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
    source $VI_HOME/plugins.vim
    ""*****************************************************************************
    "" Include user's extra bundle
    if filereadable(expand('$VI_HOME/local_bundles.vim'))
        source $VI_HOME/local_bundles.vim
    endif
call plug#end()

source $VI_HOME/general.vim
source $VI_HOME/plugins/ui.vim
source $VI_HOME/plugins/explorer.vim
source $VI_HOME/plugins/coding.vim
source $VI_HOME/plugins/langs.vim
source $VI_HOME/plugins/misc.vim

"*****************************************************************************
"
"" Include user's local vim config
if filereadable(expand('$VI_HOME/local.vim'))
  source $VI_HOME/local.vim
endif
