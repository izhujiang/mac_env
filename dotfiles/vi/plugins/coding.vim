"------------------------------------------------------------------------------
" easymotion
" https://github.com/easymotion/vim-easymotion
"
" let g:EasyMotion_do_mapping = 0 " Disable default mappings
" let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'
"
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
" makes EasyMotion work similarly to Vim's smartcase option for global searches.
let g:EasyMotion_smartcase = 1

" Type Enter or Space key and jump to first match
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1

" let g:EasyMotion_prompt = '{n}>>> '
let g:EasyMotion_prompt = 'EasyMotion search for {n} character(s): '

" let g:EasyMotion_inc_highlight = 1
" let g:EasyMotion_move_highlight = 1
" let g:EasyMotion_landing_highlight = 0
"
" let g:EasyMotion_add_search_history = 1
" let g:EasyMotion_off_screen_search = 1
"
" let g:EasyMotion_verbose = 1

" The default leader key ('<Leader><Leader>') can be changed with the |<Plug>(easymotion-prefix)|
map \ <Plug>(easymotion-prefix)
" Set this keymapping to the key sequence to use as the prefix of the mappings
" described in easymotion-default-mappings as following:
" The default configuration defines the following mappings in normal, visual
" and operator-pending mode if |g:EasyMotion_do_mapping| is on:
"     Default Mapping      | Details
"     ---------------------|----------------------------------------------
"     <Leader>f{char}      | Find {char} to the right. See |f|.
"     <Leader>F{char}      | Find {char} to the left. See |F|.
"     <Leader>t{char}      | Till before the {char} to the right. See |t|.
"     <Leader>T{char}      | Till after the {char} to the left. See |T|.
"     <Leader>w            | Beginning of word forward. See |w|.
"     <Leader>W            | Beginning of WORD forward. See |W|.
"     <Leader>b            | Beginning of word backward. See |b|.
"     <Leader>B            | Beginning of WORD backward. See |B|.
"     <Leader>e            | End of word forward. See |e|.
"     <Leader>E            | End of WORD forward. See |E|.
"     <Leader>ge           | End of word backward. See |ge|.
"     <Leader>gE           | End of WORD backward. See |gE|.
"     <Leader>j            | Line downward. See |j|.
"     <Leader>k            | Line upward. See |k|.
"     <Leader>n            | Jump to latest '/' or '?' forward. See |n|.
"     <Leader>N            | Jump to latest '/' or '?' backward. See |N|.
"     <Leader>s            | Find(Search) {char} forward and backward.
"                          | See |f| and |F|.

" TODO: need to avaid confix with other plugins
map  <leader><leader>f <Plug>(easymotion-bd-f)
nmap <leader><leader>f <Plug>(easymotion-overwin-f)
" " s{char}{char} to move to {char}{char}
map  <leader><leader>s <Plug>(easymotion-s2)
" usefull for cz, yz, dz and vz
omap z <Plug>(easymotion-s2)

nmap <leader><leader>s <Plug>(easymotion-overwin-f2)
nmap <leader><leader>t <Plug>(easymotion-t2)

" " Move to line
map <leader><leader>L <Plug>(easymotion-bd-jk)
nmap <leader><leader>L <Plug>(easymotion-overwin-line)

" " Move to word
map  <leader><leader>w <Plug>(easymotion-bd-w)
nmap <leader><leader>w <Plug>(easymotion-overwin-w)

" " Gif config
map  <Leader><Leader>/ <Plug>(easymotion-sn)
omap <Leader><Leader>/ <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" jumpto anywhere (Beginning and End of word, Camelcase, after '_', and after '#'.)
" in the {left, right, up, down} direction
map <Leader><Leader>l <Plug>(easymotion-lineforward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><Leader>h <Plug>(easymotion-linebackward)

"------------------------------------------------------------------------------
" vim-easy-align
" https://github.com/junegunn/vim-easy-align
" don't use ga, which is built-in key for printing code value of the char under the cursor in decimal, hexadecimal and octal.
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap gn <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap gn <Plug>(EasyAlign)

"------------------------------------------------------------------------------
" ale for syntax lint
" https://github.com/w0rp/ale
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0

let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

let g:ale_completion_enabled = 0
" When working with TypeScript files, ALE supports automatic imports from external modules.
let g:ale_completion_tsserver_autoimport = 0

" use the quickfix list instead of the loclist
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

" show Vim windows for the loclist or quickfix items when a file contains warnings or errors
let g:ale_open_list = 1
" keep the window open even after errors disappear.
" This can be useful if you are combining ALE with some other plugin which sets quickfix errors, etc.
" let g:ale_keep_list_window_open = 0

" Python
" https://blog.landscape.io/using-pylint-on-django-projects-with-pylint-django.html
" let g:ale_python_pylint_options = '--load-plugins pylint_django'

" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1

" By default, all available tools for all supported languages will be run.
" you can define b:ale_linters for a single buffer, or g:ale_linters globally, if you want to only select a subset of the tools.
let g:ale_linter_aliases = {'jsx': ['css', 'javascript']}
let g:ale_linters = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'sh': ['shellcheck'],
      \ 'javascript': ['eslint'],
      \ 'typescript': ['tsserver', 'tslint'],
      \ 'go': [ 'gofmt', 'golint', 'gometalinter', 'gopls', 'golangci-lint', 'govet'],
      \ 'python': ['flake8', 'pylint'],
      \ 'rust': ['cargo'],
      \ 'c': ['clang', 'clangd', 'cpplint'],
      \ 'cpp': ['clang', 'clangd', 'cpplint'],
      \ 'vim': ['ale_custom_linting_rules', 'vint'],
      \ 'dockerfile': ['dockerfile_lint', 'hadolint']
      \ }
" let g:ale_go_gopls_options = '--mode stdio'
" golangci-lint enabled by default linters: govet,  errcheck, staticcheck, unused, gosimple, structcheck, varcheck, ineffassign, deadcode, typecheck
"               38 other linters are disabled by default.
let g:ale_go_golangci_lint_options = '-D forbidigo'
    "  need to configure eclipselsp
    " \ 'java': ['checkstyle', 'javac', 'eclipselsp' ],
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'javascript': ['prettier', 'eslint'],
      \ 'typescript': ['prettier', 'eslint'],
      \ 'scss': ['prettier'],
      \ 'html': ['prettier'],
      \ 'css': ['prettier'],
      \ 'python': ['autopep8', 'yapf'],
      \ 'go': ['gofmt', 'goimports'],
      \ 'c': ['clang-format', 'uncrustify'],
      \ 'cpp': ['clang-format', 'uncrustify'],
      \ }
      " \ 'java': ['google_java_format', 'uncrustify']

" let g:ale_fixers = {'javascript': ['eslint',' prettier'] }
" let g:ale_fixers = {'javascript': ['standard']}


" Use these options to specify what text should be used for signs:
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

" Show 6 lines of errors (default: 10)
let g:ale_list_window_size = 6

" ALE sets some background colors automatically for warnings and errors in the sign gutter
" highlight clear ALEErrorSign
" highlight clear ALEWarningSign
"
" ALE's highlights problems with highlight groups which link to SpellBad, SpellCap, error, and todo groups by default.
" Set this in your vimrc file to disabling highlighting
" let g:ale_set_highlights = 0

" color scheme for ALE hightlights
" highlight ALEWarning ctermbg=DarkMagenta

"keep the sign gutter open at all times by setting the g:ale_sign_column_always to 1
" let g:ale_sign_column_always = 1

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

set statusline=%{LinterStatus()}

" There are 3 global options that allow customizing the echoed message.
" let g:ale_echo_msg_error_str = 'E'
" let g:ale_echo_msg_warning_str = 'W'
" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"

" ALE offers some commands with <Plug> keybinds for moving between warnings and errors quickly
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" TODO: ...
"------------------------------------------------------------------------------
" augroup Ale_YourGroup
"     autocmd!
"     autocmd User ALELintPre    call YourFunction()
"     autocmd User ALELintPost   call YourFunction()
"     autocmd User ALEJobStarted call YourFunction()
"     autocmd User ALEFixPre     call YourFunction()
"     autocmd User ALEFixPost    call YourFunction()
"   augroup END

"------------------------------------------------------------------------------
" UltiSnips
" YouCompleteMe and UltiSnips compatibility.
let g:UltiSnipsExpandTrigger = '<Tab>'
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'
" YouCompleteMe and UltiSnips compatibility.
" let g:UltiSnipsExpandTrigger="<c-j>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" TODO: config with $VI_HOME
" Additional UltiSnips config.
" let g:UltiSnipsSnippetsDir = $HOME . '/.vim/ultisnips'
" let g:UltiSnipsSnippetDirectories = [
"       \ $HOME . '/.vim/ultisnips',
"       \ $HOME . '/.vim/ultisnips-private'
"       \ ]

"------------------------------------------------------------------------------
" YouCompleteMe
" To prevent the execution of malicious code from a file you didn't write, YCM will ask you once per .ycm_extra_conf.py if it is safe to load.
let g:ycm_confirm_extra_conf = 0

" Normally, YCM searches for a .ycm_extra_conf.py file for compilation flags (see the User Guide for more details on how this works).
"
" YCM looks for a .ycm_extra_conf.py file in the directory of the opened file or in any directory above it in the hierarchy (recursively);
" when the file is found, it is loaded (only once!) as a Python module.
"
" NOTE: It is highly recommended to include -x <language> flag to libclang.
" This is so that the correct language is detected, particularly for header files.
" Common values are -x c for C, -x c++ for C++, -x objc for Objective-C, and -x cuda for CUDA.
"
" This option specifies a fallback path to a config file which is used if no .ycm_extra_conf.py is found.
" let g:ycm_global_ycm_extra_conf = ''
if has('nvim')
  let g:ycm_global_ycm_extra_conf = expand($HOME ."/.config/nvim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py")
  let s:lsp = expand($HOME ."/.config/nvim/third_party/ycmd-lsp")
else
  let g:ycm_global_ycm_extra_conf = expand($HOME ."/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py")
  let s:lsp = expand($HOME ."/.vim/third_party/ycmd-lsp")
endif
if filereadable(expand($HOME ."/.ycm_extra_conf.py"))
  let g:ycm_global_ycm_extra_conf = expand($HOME ."/.ycm_extra_conf.py")
endif

" YCM will by default search for an appropriate Python interpreter on your system.
" You can use this option to override that behavior and force the use of a specific interpreter of your choosing.
" DO NOT set g:ycm_server_python_interpreter. Actually, ycmd only run with the python that build it.
" (python3 ./install.py --clangd-completer --go-completer --ts-completer --rust-completer)
"
" NOTE: This interpreter is only used for the ycmd server. The YCM client running inside Vim always uses the Python interpreter that's embedded inside Vim.
" let g:ycm_server_python_interpreter = ''

" enable for debug
" let g:ycm_log_level = 'debug'

" let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']
" let g:ycm_key_list_stop_completion = ['<C-y>']

let g:ycm_key_invoke_completion = '<C-,>'
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<C-j>',  '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<C-k>', '<Up>']
let g:ycm_key_list_stop_completion = ['<C-y>', '<enter>']

" avoid to use <enter>, which is confix with enter next line
" let g:ycm_key_list_stop_completion = ['<enter>']
" <c-n> is bind to tab again by SuperTab, which walk around the confix with UltiSnips
let g:SuperTabDefaultCompletionType = '<C-n>'
" let g:SuperTabCrMapping = 0

" This option controls the key mapping used to show the full diagnostic text when the user's cursor is on the line with the diagnostic. Default: <leader>d
" let g:ycm_key_detailed_diagnostics = '<leader>d'

let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'

let g:ycm_min_num_of_chars_for_completion = 1    " 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc = 0    " 禁止缓存匹配项,每次都重新生成匹配项

let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string

let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
" let g:ycm_collect_identifiers_from_tags_files = 0 " it makes vim slower if the tags on a network directory

let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword

let g:ycm_auto_trigger = 1
let g:ycm_show_diagnostics_ui = 1
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_echo_current_diagnostic = 1
let g:ycm_open_loclist_on_ycm_diags = 1
let g:ycm_auto_hover=''

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
let g:ycm_python_binary_path = 'python3'

" conflict with other dianostics plugins like Syntastic and other dianostics plugins like Eclim
let g:syntastic_java_checkers = []
let g:EclimFileTypeValidate = 0

" if !exists("g:ycm_semantic_triggers")
"   let g:ycm_semantic_triggers = {}
" endif

" semantic suggestion will override UltiSnips snippet suggestion, so don't trigger util more then 3 characters('re!/w{4}).
let g:ycm_semantic_triggers = {
    \   'c' : ['->', '.'],
    \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s', 're!\[.*\]\s'],
    \   'ocaml' : ['.', '#'],
    \   'cpp,objcpp' : ['->', '.', '::'],
    \   'perl' : ['->'],
    \   'php' : ['->', '::'],
    \   'java,python,scala,go' : ['.', 're!\w{2}'],
    \   'javascript,jsx,javascript.jsx,typescript,typescript,tsx' : ['.', 're!\w{2}'],
    \   'cs,d,perl6,vb,elixir' : ['.'],
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

let g:ycm_filetype_whitelist = {
			\ "c":1,
			\ "cpp":1,
			\ "objc":1,
			\ "sh":1,
			\ "zsh":1,
			\ "java":1,
			\ "groovy":1,
			\ "scala":1,
      \ "js":1,
			\ "javascript":1,
      \ 'jsx':1,
			\ "typescript":1,
			\ "python":1,
			\ "go":1,
			\ "ruby":1,
			\ "perl":1,
			\ "php":1,
			\ "vim":1,
			\ "xml":1
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
    \   'mail' : 1,
    \   'markdown' : 1,
    \   'text' : 1,
    \ }

let g:ycm_filepath_blacklist = {
    \ 'html' : 1,
    \ 'jsx' : 1,
    \ 'xml' : 1,
    \}

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

" support language servers used with YCM
let g:ycm_language_server = [
  \   {
  \     'name': 'bash',
  \     'cmdline': [ 'node', expand( s:lsp . '/bash/node_modules/.bin/bash-language-server' ), 'start' ],
  \     'filetypes': [ 'sh', 'bash' ],
  \   },
  \   {
  \     'name': 'yaml',
  \     'cmdline': [ 'node', expand( s:lsp . '/yaml/node_modules/.bin/yaml-language-server' ), '--stdio' ],
  \     'filetypes': [ 'yaml' ],
  \   },
  \   {
  \     'name': 'json',
  \     'cmdline': [ 'node', expand( s:lsp . '/json/node_modules/.bin/vscode-json-languageserver' ), '--stdio' ],
  \     'filetypes': [ 'json' ],
  \   },
  \   { 'name': 'docker',
  \     'filetypes': [ 'dockerfile' ],
  \     'cmdline': [ expand( s:lsp . '/docker/node_modules/.bin/docker-langserver' ), '--stdio' ]
  \   },
  \   { 'name': 'vim',
  \     'filetypes': [ 'vim' ],
  \     'cmdline': [ expand( s:lsp . '/viml/node_modules/.bin/vim-language-server' ), '--stdio' ]
  \   },
  \ ]
  " \   { 'name': 'rust',
  " \     'filetypes': [ 'rust' ],
  " \     'cmdline': [ expand( s:lsp .  '/rust/rust-analyzer/target/release/rust-analyzer' ) ],
  " \     'project_root_files': [ 'Cargo.toml' ],
  " \   },
  "
  " \   {
  " \     'name': 'php',
  " \     'cmdline': [ 'php', expand( s:lsp . '/php/vendor/bin/php-language-server.php' ) ],
  " \     'filetypes': [ 'php' ],
  " \   },
  " \   {
  " \     'name': 'dart',
  " \     'cmdline': [ 'dart', expand( s:lsp . '/dart/analysis_server.dart.snapshot' ), '--lsp' ],
  " \     'filetypes': [ 'dart' ],
  " \   },
  " \   { 'name': 'scala',
  " \     'filetypes': [ 'scala' ],
  " \     'cmdline': [ 'metals-vim' ],
  " \     'project_root_files': [ 'build.sbt' ]
  " \   },
  " \   { 'name': 'purescript',
  " \     'filetypes': [ 'purescript' ],
  " \     'cmdline': [ expand( s:lsp . '/viml/node_modules/.bin/purescript-language-server' ), '--stdio' ]
  " \   },
  " \   { 'name': 'fortran',
  " \     'filetypes': [ 'fortran' ],
  " \     'cmdline': [ 'fortls' ],
  " \   },
  " \   { 'name': 'haskell',
  " \     'filetypes': [ 'haskell', 'hs', 'lhs' ],
  " \     'cmdline': [ 'hie-wrapper', '--lsp' ],
  " \     'project_root_files': [ '.stack.yaml', 'cabal.config', 'package.yaml' ]
  " \   },
  " \   { 'name': 'julia',
  " \     'filetypes': [ 'julia' ],
  " \     'project_root_files': [ 'Project.toml' ],
  " \     'cmdline': <See note below>
  " \   },
  " \   { 'name': 'lua',
  " \     'filetypes': [ 'lua' ],
  " \     'cmdline': [ expand( s:lsp . '/lua/lua-language-server/root/extension/server/bin/macOS/lua-language-server'),
  " \                  expand( s:lsp . '/lua/lua-language-server/root/extension/server/main.lua' ) ]
  " \   },
  " \   {
  " \     'name': 'ruby',
  " \     'cmdline': [ expand( s:lsp . '/ruby/bin/solargraph' ), 'stdio' ],
  " \     'filetypes': [ 'ruby' ],
  " \   },
  " \   { 'name': 'kotlin',
  " \     'filetypes': [ 'kotlin' ],
  " \     'cmdline': [ expand( s:lsp . '/kotlin/server/build/install/server/bin/server' ) ],
  " \   },
  " \   { 'name': 'd',
  " \     'filetypes': [ 'd' ],
  " \     'cmdline': [ expand( s:lsp . '/d/serve-d' ) ],
  " \   },
  " \   { 'name': 'vue',
  " \     'filetypes': [ 'vue' ],
  " \     'cmdline': [ expand( s:lsp . '/vue/node_modules/.bin/vls' ) ]
  " \   },


"  don't use inoremap <expr> <CR>, which will disable <CR> to enter next line
" inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

nnoremap gd :YcmCompleter GoTo<CR> " goto definition
" nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>    "force recomile with syntastic
" nnoremap  <F4> :YcmDiags<CR>

augroup event_ycm
  autocmd!
  autocmd InsertLeave * if pumvisible() != 0|pclose|endif    "close previewwindow when leave from insert mode
augroup END

"------------------------------------------------------------------------------
" emmet-vim
" https://github.com/mattn/emmet-vim
" defautl emmet leader key is <c-y>
  " Enable just for html/css/javascript/typescript
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key=','
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
  \      'extends' : 'jsx',
  \  },
  \}
" let g:user_emmet_mode='n'    "only enable normal mode functions.
" let g:user_emmet_mode='inv'  "enable all functions, which is equal to
let g:user_emmet_mode='a'    "enable all function in all mode.
" vim-test
" https://github.com/vim-test/vim-test
let test#strategy = "dispatch"

"------------------------------------------------------------------------------
" vim-fugitive
" https://github.com/tpope/vim-fugitive
if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

" noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
" noremap <Leader>gsh :Gpush<CR>
" noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
" noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>
"" Open current line on GitHub
nnoremap <Leader>gb :.Gbrowse<CR>
