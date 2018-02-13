
if exists('$TMUX')
  set  term=screen-256color
endif

" python with virtualenv support
" todo: some problem with zsh_plugin vi-mode
" py3 << EOF
" import os
" import sys
" if 'VIRTUAL_ENV' in os.environ:
"   project_base_dir = os.environ['VIRTUAL_ENV']
"   activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"   print(activate_this)
"   execfile(activate_this, dict(__file__=activate_this))
" EOF
