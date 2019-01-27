let g:ycm_confirm_extra_conf = 0 "关闭加载.ycm_extra_conf.py提示
" let g:ycm_global_ycm_extra_conf = ''
if has('nvim')
    let g:ycm_global_ycm_extra_conf = '~/.config/nvim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
else
    let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
endif

" enable for debug
" let g:ycm_log_level = 'debug'

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
let g:ycm_python_binary_path = 'python3'

" conflict with other dianostics plugins like Syntastic and other dianostics plugins like Eclim
let g:syntastic_java_checkers = []
let g:EclimFileTypeValidate = 0

let g:ycm_semantic_triggers = {
    \   'c' : ['->', '.'],
    \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s', 're!\[.*\]\s'],
    \   'ocaml' : ['.', '#'],
    \   'cpp,objcpp' : ['->', '.', '::'],
    \   'perl' : ['->'],
    \   'php' : ['->', '::'],
    \   'java,javascript,javascript,jsx,tsx,txypescript,python,scala,go' : ['.', 're!\w{2}'],
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

" only allow c/c++/... files to enable YCM be turned on
" add javascript.jsx setted by mxw/vim-jsx because *.js's filetype setted by mxw/vim-jsx
let g:ycm_filetype_whitelist = {
			\ "c":1,
			\ "cpp":1,
			\ "objc":1,
			\ "sh":1,
			\ "zsh":1,
			\ "java":1,
			\ "groovy":1,
			\ "scala":1,
			\ "javascript":1,
            \ 'javascript.jsx':1,
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

" ---YCM--------------
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"    "回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"


" let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']
" let g:ycm_key_list_stop_completion = ['<C-y>']
let g:ycm_key_list_stop_completion = ['<enter>']
let g:ycm_key_invoke_completion = '<C-,>'
" This option controls the key mapping used to show the full diagnostic text when the user's cursor is on the line with the diagnostic. Default: <leader>d
" let g:ycm_key_detailed_diagnostics = '<leader>d'

nnoremap <leader>g :YcmCompleter GoTo<CR> " 跳转到定义处
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>    "force recomile with syntastic
nnoremap  <F4> :YcmDiags<CR>

autocmd InsertLeave * if pumvisible() != 0|pclose|endif    "离开插入模式后自动关闭预览窗口
