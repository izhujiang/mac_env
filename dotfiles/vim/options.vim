"------------------------------------------------------------------------------
" General
"------------------------------------------------------------------------------

" let's make sure we are in noncompatble mode
set nocompatible              " required
" Enable filetype plugins
filetype plugin indent on    " required

" Rebind <Leader> key, with a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ','


" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

set helplang=cn             "help file in chinese

"------------------------------------------------------------------------------
" Sessions
"------------------------------------------------------------------------------
let g:session_autoload = 'no'
let g:session_autosave = 'no'

" Define what to save with :mksession
" blank - empty windows
" buffers - all buffers not only ones in a window
" curdir - the current directory
" folds - including manually created ones
" help - the help window
" options - all options and mapping
" winsize - window sizes
" tabpages - all tab pages
" slash and unix - share session file between unix and windows
set sessionoptions=blank,buffers,curdir,folds,help,options,winsize,tabpages,slash,unix

" Remember things between sessions
"
" '20  - remember marks for 20 previous files
" \"50 - save 50 lines for each register
" :20  - remember 20 items in command-line history
" /20  - remember 20 items in search history
" %    - remember the buffer list (if vim started without a file arg)
" n    - set name of viminfo file
" set viminfo='20,\"50,:20,/20,%,n~/.viminfo.go

" Remember info about open buffers on close
set viminfo^=%

"------------------------------------------------------------------------------
" Files
"------------------------------------------------------------------------------
set autoread                "reload file when modified out of vim
" Use Unix as the standard file type
set ffs=unix,mac,dos

if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=utf-8,gbk
endif


" Disable backup and swap files because of trigger too many events
" for tfile system watchers
set nobackup
set nowritebackup
set noswapfile

"------------------------------------------------------------------------------
" Editing
"------------------------------------------------------------------------------
set clipboard=unnamed
set nopaste

" Don't redraw while executing macros, register and other command without
" through input (good performance config)
set lazyredraw


" Configure backspace so it acts as it should act
set backspace=eol,start,indent

" Completion options (select longest + show menu even if a single match is found)
set completeopt=longest,menu    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
" set completeopt=longest,menuone
" Set command-line completion mode

set wildmode=list:longest,full
set whichwrap+=<,>,h,l

" Enable Ctrl-A/Ctrl-X to work on octal and hex numbers, as well as characters
set nrformats=octal,hex,alpha

"------------------------------------------------------------------------------
" Buffers, Windows and Tabs
" A buffer is the in-memory text of a file.
" A window is a viewport on a buffer.
" A tab page is a collection of windows.
"------------------------------------------------------------------------------
" --buffers
" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set showtabline=2
catch
endtry

" --windows
" splite at specific region
set splitbelow
set splitright

"------------------------------------------------------------------------------
" Editor UI
"------------------------------------------------------------------------------
" --Colors and Fonts
" set background=dark
" add vertical lines on columns

" --
" set colorcolumn=80,160

" Highlight current line - allows you to track cursor position more easily
set cursorline

" Show line, column number, and relative position within a file in the status line
set ruler

" Show line numbers - could be toggled on/off on-fly by pressing F6
set number
set relativenumber

" --folding
set foldmethod=syntax       "代码折叠
set foldlevel=99


" --Tabs
" Use spaces instead of tabs
set expandtab
" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set tabstop=4
set shiftwidth=4
" Round indent to multiple of 'shiftwidth' for > and < commands
set shiftround

" --indent
set autoindent "Auto indent
set smartindent "Smart indent
set nowrap "Don't Wrap lines (it is stupid)

" --linebreak
" Linebreak on 500 characters
set linebreak
set textwidth=500

"------------------------------------------------------------------------------
" Search
"------------------------------------------------------------------------------
" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch


" highlight trailing space
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Make sure that extra margin on left is removed
set foldcolumn=0
"------------------------------------------------------------------------------
" Status line
"------------------------------------------------------------------------------
" Always show the status line
set laststatus=2
" Show (partial) commands (or size of selection in Visual mode) in the status line
set showcmd


"------------------------------------------------------------------------------
" Langs
"------------------------------------------------------------------------------
" Golong
let g:go_fmt_command = "gofmt" "Explicited the formater plugin (gofmt, goimports, goreturn...)

" By default syntax-highlighting for Functions, Methods and Structs is disabled.
" Let's enable them!
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }


" -------Python
" let python_highlight_all=1


"------------HogoHelper---------------------------------------------------------------
" :HugoHelperSpellCheck toggles the spell check for the current language.
" Running it once, turns the spell check on. Running it again, turns it off.
let g:hugohelper_spell_check_lang = 'en_us'
"------------------------------------------------------------------------------
" Plugins
"------------------------------------------------------------------------------
" -----NERDTree-------------------------------------------
let NERDTreeWinPos='left'
let NERDTreeWinSize=30
let NERDTreeDirArrows=1
let NERDTreeMinimalUI=1
let NERDTreeIgnore=['\.o$', '\.pyc$', '\.php\~$','\~$']

" -----Powerline-----------------------------------------
"这个是安装字体后 必须设置此项"
let g:airline_powerline_fonts = 1

"打开tabline功能,方便查看Buffer和切换，这个功能比较不错"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" -------python-mode------------------------------------------------------
" --Common functionality
" Turn on the whole plugin
let g:pymode = 1
let g:pymode_python = 'python3'
let g:pymode_trim_whitespaces = 1
let g:pymode_options = 1
let g:pymode_options_max_line_length = 79
let g:pymode_options_colorcolumn = 1

" Setup pymode quickfix window
let g:pymode_quickfix_minheight = 3
let g:pymode_quickfix_maxheight = 6

let g:pymode_indent = 1
let g:pymode_folding = 1

" Enable pymode-motion
let g:pymode_motion = 1
" Pymode could show documentation for current word by pydoc.
let g:pymode_doc = 1

" Enable automatic virtualenv detection                     'g:pymode_virtualenv'
let g:pymode_virtualenv = 0
" Set path to virtualenv manually                  'g:pymode_virtualenv_path'
" let g:pymode_virtualenv_path = $VIRTUAL_ENV

let g:pymode_run = 1
" Pymode automatically detects available debugger (like pdb, ipdb, pudb) and user
" can set/unset breakpoint with one key and without code checking and etc.
let g:pymode_breakpoint = 1

" Turn on code checking
let g:pymode_lint = 1
let g:pymode_lint_on_write = 1
let g:pymode_lint_unmodified = 0
let g:pymode_lint_on_fly = 0
let g:pymode_lint_message = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
"let g:pymode_lint_ignore = "E501,W"
"let g:pymode_lint_select = "E501,W0011,W430"

" Auto open cwindow (quickfix) if any errors have been found
let g:pymode_lint_cwindow = 1
let g:pymode_lint_signs = 1
let g:pymode_lint_todo_symbol = 'WW'
let g:pymode_lint_comment_symbol = 'CC'
let g:pymode_lint_visual_symbol = 'RR'
let g:pymode_lint_error_symbol = 'EE'
let g:pymode_lint_info_symbol = 'II'
let g:pymode_lint_pyflakes_symbol = 'FF'


" Pymode has the ability to set code checkers options from pymode variables:
let g:pymode_lint_options_pep8 = {'max_line_length': g:pymode_options_max_line_length}
let g:pymode_lint_options_pyflakes = { 'builtins': '_' }
let g:pymode_lint_options_mccabe = { 'complexity': 12 }
let g:pymode_lint_options_pep257 = {}
let g:pymode_lint_options_pylint = {'max-line-length': g:pymode_options_max_line_length}

" Pymode supports Rope refactoring operations, code completion and code assists.
 " Turn on the rope script                                        'g:pymode_rope'
 let g:pymode_rope = 1
let g:pymode_rope_regenerate_on_write = 1
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 1
let g:pymode_rope_lookup_project = 0
" let g:pymode_rope_autoimport = 0
" let g:pymode_rope_autoimport_modules = ['os', 'shutil', 'datetime']
let g:pymode_rope_autoimport_import_after_complete = 0
" Values are (`e`, `new`, `vnew`)
let g:pymode_rope_goto_definition_cmd = 'new'

" Syntax
" Turn on pymode syntax                                        *'g:pymode_syntax'*
let g:pymode_syntax = 1
let g:pymode_syntax_slow_sync = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_highlight_async_await = g:pymode_syntax_all
let g:pymode_syntax_highlight_equal_operator = g:pymode_syntax_all
let g:pymode_syntax_highlight_stars_operator = g:pymode_syntax_all
let g:pymode_syntax_highlight_self = g:pymode_syntax_all
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
let g:pymode_syntax_string_formatting = g:pymode_syntax_all
let g:pymode_syntax_string_format = g:pymode_syntax_all
let g:pymode_syntax_string_templates = g:pymode_syntax_all
let g:pymode_syntax_doctests = g:pymode_syntax_all
let g:pymode_syntax_builtin_objs = g:pymode_syntax_all
let g:pymode_syntax_builtin_types = g:pymode_syntax_all
let g:pymode_syntax_highlight_exceptions = g:pymode_syntax_all
let g:pymode_syntax_docstrings = g:pymode_syntax_all

" -------Syntastic------------------------------------------------------
set statusline+=%#warningmsg#
" todo SyntasticStatuslineFlag() ?
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" -------YouCompleteMe and UltiSnips------------------------------------
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.

" YouCompleteMe and UltiSnips compatibility.
let g:UltiSnipsExpandTrigger = '<Tab>'
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Additional UltiSnips config.
let g:UltiSnipsSnippetsDir = $HOME . '/.vim/ultisnips'
let g:UltiSnipsSnippetDirectories = [
      \ $HOME . '/.vim/ultisnips',
      \ $HOME . '/.vim/ultisnips-private'
      \ ]


let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示
let g:ycm_global_ycm_extra_conf='~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'

let g:ycm_min_num_of_chars_for_completion=2    " 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0    " 禁止缓存匹配项,每次都重新生成匹配项

let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword


" By default, YCM will query the UltiSnips plugin for possible completions of snippet triggers. This option can turn that behavior off.
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure


" If you work on a Python 3 project, you may need to set g:ycm_python_binary_path to the Python interpreter you use for your project to get completions for that version of Python.
" let g:ycm_python_binary_path =

let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:ycm_key_list_accept_completion = ['<C-y>']

" Disable unhelpful semantic completions.
let g:ycm_filetype_specific_completion_to_disable = {
      \   'c': 1,
      \   'gitcommit': 1,
      \   'haskell': 1,
      \   'javascript': 1,
      \   'ruby': 1
      \ }

let g:ycm_semantic_triggers = {
      \   'haskell': [
      \     '.',
      \     '(',
      \     ',',
      \     ', '
      \   ],
      \   'mail': [
      \     're!^Bcc:(.*, ?| ?)',
      \     're!^Cc:(.*, ?| ?)',
      \     're!^From:(.*, ?| ?)',
      \     're!^Reply-To:(.*, ?| ?)',
      \     're!^To:(.*, ?| ?)'
      \   ],
      \   'markdown': [
      \     ']('
      \   ]
      \ }

" Same as default, but with "mail", "markdown" and "text" removed.
let g:ycm_filetype_blacklist = {
      \   'notes': 1,
      \   'unite': 1,
      \   'tagbar': 1,
      \   'pandoc': 1,
      \   'qf': 1,
      \   'vimwiki': 1,
      \   'infolog': 1,
      \ }
