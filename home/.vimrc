"basic settings"
syntax enable
syntax on

:set number

let mapleader = ","
let g:mapleader = ","


"set bundles"
if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
endif

set shortmess=atI
set noswapfile
set cursorcolumn     " 突出显示当前列
hi CursorColumn cterm=None ctermbg=DarkGrey guibg=grey
set cursorline       " 突出显示当前行
hi Search cterm=None ctermbg=LightBlue guibg=LightYellow
set autoread         " 文件修改之后自动载入
set nobackup         " 不备份文件
set hlsearch         " 高亮搜索
set incsearch        " 实时搜索
set ignorecase smartcase
set ruler            " 右下角显示光标的位置


set whichwrap+=<,>,h,l "   退格和方向键可以换行
set showcmd

" 状态栏配置
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
set laststatus=2   " 显示状态栏

set showmatch      " 跳转并高亮一下匹配的括号

" ==========================================================
" 代码相关
" ==========================================================
" set nofoldenable   " 启动vim时打开/关闭折叠代码
set foldenable
set foldmethod=indent
set foldlevel=99

" 防止tmux下vim的背景色显示异常
" Refer: http://sunaku.github.io/vim-256color-bce.html
if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

"search "

