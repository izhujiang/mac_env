
set nocompatible              " required
filetype plugin indent on    " required

" rebind <Leader> key
let mapleader = ','


"common conf {{             通用配置
set ai                      "自动缩进
set bs=2                    "在insert模式下用退格键删除
set showmatch               "代码匹配
set laststatus=2            "总是显示状态行
set cursorline              "为光标所在行加下划线
set number                  "显示行号
set relativenumber
set autoread                "文件在Vim之外修改过，自动重新读入


set ignorecase              "检索时忽略大小写

" set fileencodings=uft-8,gbk "使用utf-8或gbk打开文件
" set encoding=utf-8

if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=utf-8,gbk
endif

" enable vim using system clipboard
set clipboard=unnamed

set hls                     "检索时高亮显示匹配项
set helplang=cn             "帮助系统设置为中文


set foldmethod=syntax       "代码折叠
set foldlevel=99
set autoindent 
set nopaste

" easyly moving of code blocks in visual mode
vnoremap < <gv  
vnoremap > >gv

" Disable backup and swap files because of trigger too many events
" for tfile system watchers
set nobackup
set nowritebackup
set noswapfile
"}}

" splite at specific region
set splitbelow
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


"
" Enable folding with the spacebar
" nnoremap <space> za
 
"conf for tabs, 为标签页进行的配置，通过ctrl h/l切换标签等
" nnoremap <C-l> gt
" nnoremap <C-h> gT
"  nnoremap <leader>t : tabe<CR>
