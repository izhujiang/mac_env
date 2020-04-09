" vim-bootstrap b0a75e4

" has("vim_starting") returns true on startup, false when running
if has('vim_starting')
  set nocompatible               " Be iMproved
endif

let g:vim_bootstrap_langs = 'go,html,javascript,typescript,python,scala'

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
map <silent> <leader>sv :source $MYVIMRC<cr>

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

  " if has('nvim')
  "   silent !\curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  " else
  "   silent !\curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  " endif

  silent !\curl -fLo ${VI_HOME}/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  let g:not_finish_vimplug = 'yes'

  autocmd VimEnter * PlugInstall
endif


" Set general(built-in) options before plugins
" let vi_cfg_root = '~/.config/nvim'
" execute 'source' $VI_CFG_DIR .. '/general.vim'
" or
source $VI_CFG_DIR/general.vim
call plug#begin(expand('$VI_CFG_DIR/plugged'))
    " execute 'source' vi_cfg_root .. '/plugins.vim'
    " or
    source $VI_CFG_DIR/plugins.vim
    ""*****************************************************************************
    "" Include user's extra bundle
    if filereadable(expand($VI_CFG_DIR .. '/local_bundles.vim'))
        source $VI_CFG_DIR/local_bundles.vim
    endif
call plug#end()

"if has('nvim')
"    call plug#begin(expand('~/.config/nvim/plugged'))
"        source ${MY_ENV_ROOT}/dotfiles/vi/plugins.vim
"        "*****************************************************************************
"        "" Include user's extra bundle
"        if filereadable(expand("~/.config/nvim/local_bundles.vim"))
"            source ~/.config/nvim/local_bundles.vim
"        endif
"    call plug#end()
"else
"    call plug#begin(expand('~/.vim/plugged'))
"        source ${MY_ENV_ROOT}/dotfiles/vi/plugins.vim
"    call plug#end()
"endif

" Required:
" for plugin in split(globpath('$MY_ENV_ROOT/dotfiles/vi/plugins', '/*.vim'), '\n')
for plugin in split(glob($VI_CFG_DIR .. '/plugins/*.vim'), '\n')
    " echo plugin
    exe 'source'.plugin
endfor
" colorscheme molokai

" Enable matchit plugin shiped with vim
runtime macros/matchit.vim

" if exists('$TMUX')
"     set  term=screen-256color
" endif

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

" terminal emulation
if g:vim_bootstrap_editor == 'nvim'
  nnoremap <silent> <leader>sh :split term://zsh<CR>
  " map common commands run in terminal.
  " nnoremap <silent> <leader>sz :terminal top<CR>
  nnoremap <silent> <leader>vh :vsplit term://zsh<CR>
elseif v:version >= 800
  nnoremap <silent> <leader>sh :terminal <CR>
  nnoremap <silent> <leader>sv :vertical terminal<CR>
endif

" only work with nvim
if has('nvim')
    autocmd TermOpen term://* startinsert
    autocmd TermOpen setlocal statusline=%{b:term_title}

    if executable('nvr')
        " get a new window for inserting the commit message instead of a nested nvim process
        let $GIT_EDITOR="nvr -cc split --remote-wait +'set bufhidden=wipe'"
        " let $GIT_EDITOR="nvr --remote-wait +'set bufhidden=wipe'"
        " git waits for nvr to finish, so make sure to delete the buffer after saving the commit message: :w | bd.
        " don't like using :w | bd and prefer the good old :wq (or :x)
        autocmd FileType gitcommit,gitrebase,gitconfig set bufhidden=delete
    endif
endif
"*****************************************************************************
"" Custom configs
"*****************************************************************************

augroup completion_preview_close
  autocmd!
  if v:version > 703 || v:version == 703 && has('patch598')
    autocmd CompleteDone * if !&previewwindow && &completeopt =~ 'preview' | silent! pclose | endif
  endif
augroup END

"*****************************************************************************
if g:vim_bootstrap_editor == 'nvim'
    "" Include user's local vim config
    if filereadable(expand($VI_CFG_DIR .. '/local_init.vim'))
        source $VI_CFG_DIR/local_init.vim
    endif
endif
