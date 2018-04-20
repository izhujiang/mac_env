"------------------------------------------------------------------------------
" General
"------------------------------------------------------------------------------

" Enable filetype plugins
filetype plugin indent on    " required

" Rebind <Leader> key, with a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ','
" mapping the reverse character search command to another key.
noremap \ ,

" Disable arrowskeys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

" set helplang=cn             "help file in chinese

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

" writes the content of the file automatically if you call :make.
" vim-go also makes use of this setting.
set autowrite

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
" colorscheme vim-material

" set background=dark
" colorscheme solarized

let g:rehash256 = 1
let g:molokai_original = 1
colorscheme molokai

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
"" -------Python
" for python ide configure
au BufNewFile,BufRead *.py
\ set tabstop=4 |
\ set softtabstop=4 |
\ set shiftwidth=4 |
\ set textwidth=79 |
\ set expandtab |
\ set fileformat=unix |
\ set smartindent  "  编写python代码时会使#(注释)自动回退到行首
" more options reference to pymode.
" let python_highlight_all=1

au BufNewFile,BufRead *.go
\ setlocal tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab fileformat=unix
" ----Golong

" Currently by default :GoDecls and :GoDeclsDir show type and function declarations.
let g:go_decls_includes = "func,type"

" The "go to definition" command families are very powerful but yet easy to use.
" Under the hood it uses by default the tool guru.guru has an excellent track record of being very predictable.
" But sometimes it's very slow for certain queries.
" vim-go was using godef which is very fast on resolving queries.
let g:go_def_mode = 'guru'
" let g:go_def_mode = 'godef'

" let g:go_fmt_command = "gofmt" "Explicited the formater plugin (gofmt, goimports, goreturn...)
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1

"
" By default syntax-highlighting for Functions, Methods and Structs is disabled.
" Let's enable them!
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_fields = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
" let g:go_highlight_generate_tags = 1

" There are two types of error lists in Vim: location list and quickfix
" use only quickfix for Build, Check, Tests, et
let g:go_list_type = "quickfix"

" :GoMetaLinter for a given Go source code. By default it'll run go vet, golint and errcheck concurrently.
" gometalinter collects all the outputs and normalizes it to a common format.
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['golint']
let g:go_metalinter_deadline = "5s"

" :GoInfo, Identifier resolution
" vim-go has a support to automatically show the information whenever you move your cursor.
" let g:go_auto_type_info = 1
let g:go_auto_type_info = 0
" status line is updated automatically
" set updatetime=800

" :GoSameIds :GoSameIdsClear,and GoSameIdsToggle
" go_auto_sameids enabled by :GoSameIDsAutoToggle
let g:go_auto_sameids = 0

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


" ------js/html/css
au BufNewFile,BufRead *.js,*.htm,*.html,*.css
\ set tabstop=2 |
\ set softtabstop=2 |
\ set shiftwidth=2

let g:user_emmet_install_global = 0
autocmd FileType html,css
\ EmmetInstall |
" let g:user_emmet_mode='n'    "only enable normal mode functions.
" let g:user_emmet_mode='inv'  "enable all functions, which is equal to
\ let g:user_emmet_mode='a'    "enable all function in all mode.

" -------Markdown
" options ref to https://github.com/plasticboy/vim-markdown
autocmd BufNewFile,BufReadPost *.md
\ set filetype=markdown
" let g:vim_markdown_folding_disabled = 1
\ let g:vim_markdown_folding_style_pythonic = 1
\ let g:vim_markdown_override_foldtext = 0
\ let g:vim_markdown_folding_level = 6
" let g:vim_markdown_no_default_key_mappings = 1
\ let g:vim_markdown_toc_autofit = 1
" let g:vim_markdown_emphasis_multiline = 0
\ let g:vim_markdown_math = 1
\ set conceallevel=2
" let g:vim_markdown_conceal = 0
" let g:tex_conceal = ""

" ref to help:markdown_composer
" seems not work
\ let g:markdown_composer_refresh_ratea = 10000

" options for instant-markdown, ref to https://github.com/suan/vim-instant-markdown
" autocmd FileType markdown set shell=bash\ -i
" set shell=bash\ -i
" au FileType markdown setl shell=bash\ -i
" " This will cause vim-instant-markdown to only refresh on the following events:
" " -No keys have been pressed for a while
" " -A while after you leave insert mode
" " -You save the file being edited
" let g:instant_markdown_slow = 1
" " By default, vim-instant-markdown will automatically launch the preview window when you open a markdown file.
" " let g:instant_markdown_autostart = 0
"
" " By default, the server only listens on localhost. To make the server available to others in your network
" " Only use this setting on trusted networks!
" " let g:instant_markdown_open_to_the_world = 1
"
" " By default, external resources such as images, stylesheets, frames and plugins are allowed. To block such content
" " let g:instant_markdown_allow_external_content = 0

"------------HogoHelper---------------------------------------------------------------
" :HugoHelperSpellCheck toggles the spell check for the current language.
" Running it once, turns the spell check on. Running it again, turns it off.
let g:hugohelper_spell_check_lang = 'en_us'
"
" -------Java
" options ref to https://github.com/sbdchd/neoformat
autocmd BufNewFile,BufReadPost *.* 
\ let g:neoformat_enabled_java = ['uncrustify', 'astyle']

" configure Neomake to open the list automatically:
let g:neomake_open_list = 2

" -------Markdown
" options ref to https://github.com/plasticboy/vim-markdown
autocmd BufNewFile,BufReadPost *.md
\ set filetype=markdown
" let g:vim_markdown_folding_disabled = 1
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
" let g:airline_theme='material'

"打开tabline功能,方便查看Buffer和切换，这个功能比较不错"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" -------python-mode------------------------------------------------------
" " --Common functionality
" " Turn on the whole plugin
" let g:pymode = 1
" let g:pymode_python = 'python3'
" let g:pymode_trim_whitespaces = 1
" let g:pymode_options = 1
" let g:pymode_options_max_line_length = 79
" let g:pymode_options_colorcolumn = 1
"
" " Setup pymode quickfix window
" let g:pymode_quickfix_minheight = 3
" let g:pymode_quickfix_maxheight = 10
"
" let g:pymode_indent = 1
" let g:pymode_folding = 1
"
" " Enable pymode-motion
" let g:pymode_motion = 1
" " Pymode could show documentation for current word by pydoc.
" let g:pymode_doc = 1
"
" " Enable automatic virtualenv detection                     'g:pymode_virtualenv'
" let g:pymode_virtualenv = 1
" " Set path to virtualenv manually                  'g:pymode_virtualenv_path'
" " let g:pymode_virtualenv_path = $VIRTUAL_ENV
"
" let g:pymode_run = 1
" " Pymode automatically detects available debugger (like pdb, ipdb, pudb) and user
" " can set/unset breakpoint with one key and without code checking and etc.
" let g:pymode_breakpoint = 1
"
" " Turn on code checking
" let g:pymode_lint = 1
" let g:pymode_lint_on_write = 0
" let g:pymode_lint_unmodified = 0
" let g:pymode_lint_on_fly = 0
" let g:pymode_lint_message = 1
" let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
"
" ----------------------- remove \
" let g:pymode_lint_ignore = \"E501,W"
" let g:pymode_lint_select = \"E501,W0011,W430"
"
" " Auto open cwindow (quickfix) if any errors have been found
" let g:pymode_lint_cwindow = 1
" let g:pymode_lint_signs = 1
" let g:pymode_lint_todo_symbol = 'WW'
" let g:pymode_lint_comment_symbol = 'CC'
" let g:pymode_lint_visual_symbol = 'RR'
" let g:pymode_lint_error_symbol = 'EE'
" let g:pymode_lint_info_symbol = 'II'
" let g:pymode_lint_pyflakes_symbol = 'FF'
"
"
" " Pymode has the ability to set code checkers options from pymode variables:
" let g:pymode_lint_options_pep8 = {'max_line_length': g:pymode_options_max_line_length}
" let g:pymode_lint_options_pyflakes = { 'builtins': '_' }
" let g:pymode_lint_options_mccabe = { 'complexity': 12 }
" let g:pymode_lint_options_pep257 = {}
" let g:pymode_lint_options_pylint = {'max-line-length': g:pymode_options_max_line_length}
"
" " Pymode supports Rope refactoring operations, code completion and code assists.
"  " Turn offi the rope script                                        'g:pymode_rope'
"  let g:pymode_rope = 0
" let g:pymode_rope_regenerate_on_write = 1
" let g:pymode_rope_completion = 0
" let g:pymode_rope_complete_on_dot = 1
" let g:pymode_rope_lookup_project = 0
" " let g:pymode_rope_autoimport = 0
" " let g:pymode_rope_autoimport_modules = ['os', 'shutil', 'datetime']
" let g:pymode_rope_autoimport_import_after_complete = 0
" " Values are (`e`, `new`, `vnew`)
" let g:pymode_rope_goto_definition_cmd = 'new'

" " Syntax
" " Turn on pymode syntax                                        *'g:pymode_syntax'*
" let g:pymode_syntax = 1
" let g:pymode_syntax_slow_sync = 1
" let g:pymode_syntax_all = 1
" let g:pymode_syntax_highlight_async_await = g:pymode_syntax_all
" let g:pymode_syntax_highlight_equal_operator = g:pymode_syntax_all
" let g:pymode_syntax_highlight_stars_operator = g:pymode_syntax_all
" let g:pymode_syntax_highlight_self = g:pymode_syntax_all
" let g:pymode_syntax_indent_errors = g:pymode_syntax_all
" let g:pymode_syntax_space_errors = g:pymode_syntax_all
" let g:pymode_syntax_string_formatting = g:pymode_syntax_all
" let g:pymode_syntax_string_format = g:pymode_syntax_all
" let g:pymode_syntax_string_templates = g:pymode_syntax_all
" let g:pymode_syntax_doctests = g:pymode_syntax_all
" let g:pymode_syntax_builtin_objs = g:pymode_syntax_all
" let g:pymode_syntax_builtin_types = g:pymode_syntax_all
" let g:pymode_syntax_highlight_exceptions = g:pymode_syntax_all
" let g:pymode_syntax_docstrings = g:pymode_syntax_all

" -------Syntastic------------------------------------------------------
" set statusline+=%#warningmsg#
" " todo SyntasticStatuslineFlag() ?
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_aggregate_errors = 1
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 1
" " install flake8 first
" let g:syntastic_python_checkers=['flake8']
" " let g:syntastic_python_checkers=['flake8', 'pep8', 'python3']

" -------YouCompleteMe and UltiSnips------------------------------------
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.

" YouCompleteMe and UltiSnips compatibility.
" let g:UltiSnipsExpandTrigger = '<Tab>'
" let g:UltiSnipsJumpForwardTrigger = '<Tab>'
" let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'
" YouCompleteMe and UltiSnips compatibility.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Additional UltiSnips config.
let g:UltiSnipsSnippetsDir = $HOME . '/.vim/ultisnips'
let g:UltiSnipsSnippetDirectories = [
      \ $HOME . '/.vim/ultisnips',
      \ $HOME . '/.vim/ultisnips-private'
      \ ]


let g:ycm_confirm_extra_conf = 0 "关闭加载.ycm_extra_conf.py提示
" let g:ycm_global_ycm_extra_conf = ''
let g:ycm_global_ycm_extra_conf = $VIM . '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'

let g:ycm_min_num_of_chars_for_completion = 2    " 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc = 0    " 禁止缓存匹配项,每次都重新生成匹配项

let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword

let g:ycm_auto_trigger = 1
let g:ycm_show_diagnostics_ui = 1
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_echo_current_diagnostic = 1
let g:ycm_open_loclist_on_ycm_diags = 1


let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_max_diagnostics_to_display = 30

" [ 'same-buffer', 'horizontal-split', 'vertical-split', 'new-tab', 'new-or-existing-tab']
let g:ycm_goto_buffer_command = 'same-buffer'

" By default, YCM will query the UltiSnips plugin for possible completions of snippet triggers. This option can turn that behavior off.
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure


" If you work on a Python 3 project, you may need to set g:ycm_python_binary_path to the Python interpreter
" you use for your project to get completions for that version of Python.
" YCM will use the first python executable it finds in the PATH to run jedi. This means that if you are in a virtual environment
" and you start vim in that directory, the first python that YCM will find will be the one in the virtual environment,
" so jedi will be able to provide completions for every package you have in the virtual environment.
let g:ycm_python_binary_path = 'python'

let g:syntastic_java_checkers = []
let g:EclimFileTypeValidate = 0

let g:ycm_semantic_triggers = {
    \   'c' : ['->', '.'],
    \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
    \             're!\[.*\]\s'],
    \   'ocaml' : ['.', '#'],
    \   'cpp,objcpp' : ['->', '.', '::'],
    \   'perl' : ['->'],
    \   'php' : ['->', '::'],
    \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
    \   'ruby' : ['.', '::'],
    \   'lua' : ['.', ':'],
    \   'erlang' : [':'],
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

" Disable unhelpful semantic completions.
let g:ycm_filetype_specific_completion_to_disable = {
    \   'gitcommit': 1,
    \   'haskell': 1,
    \   'ruby': 1,
    \ }

let g:ycm_filter_diagnostics = {}
" \ "java": {
" \      "regex": [ ".*taco.*", ... ],
" \      "level": "error",
" \    }
" \ }
