"basic settings"
syntax enable
syntax on

:set number

let mapleader = ","
let g:mapleader = ","

"set bundles"
" use THIEF_HOME_PATH to config your vimrc.bundle path.
let bundle_path= $THIEF_HOME_PATH . "/.vimrc.bundles"
if filereadable(bundle_path)
    source $THIEF_HOME_PATH/.vimrc.bundles
endif

" install missing plugins on startup by Plug
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" 使用jk来替换Esc键
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
set cpo-=<
imap jk <Esc>
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

" quick scope 行内快速跳转
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
"highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
"highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

" easy motion 当前屏幕内快速跳转
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" backspace : delete line break
set backspace=2
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

" set indent
filetype indent on
set tabstop=4
set shiftwidth=4
set softtabstop=4

" set background
"set t_Co=256
"set background=dark
"let g:solarized_termcolors=256
colorscheme solarized

" 快速open file
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" indent guide
"let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
"let g:indent_guides_start_level=2
" 色块宽度
"let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
"nmap <silent> <Leader>i <Plug>IndentGuidesToggle
" set indent line
"let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey ctermbg=4


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
set laststatus=2   "总是显示状态栏

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

