"-----基础配置----
"GUI 设置
set guifont=Menlo\ regular\ 14
set guioptions-=T
set guioptions-=m
"不与Vi兼容
set modelines=0
set nocompatible
"语法高亮
syntax on
"底部显示模式类型
set showmode
"显示命令
set showcmd
"使用鼠标
set mouse=a
"退格键
set backspace=indent,eol,start
"使用utf-8编码
set encoding=utf-8
set fencs=utf-8,gb18030,gbk,gb2312,cp936,usc-bom,shift-jis
"启用256色
set t_Co=256
"开启文件类型检查载入相应的缩进规则
filetype on
filetype plugin on
filetype indent on
"配色方案
"set termguicolors
"colorscheme monotonic
"colorscheme monotonic-light
colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1
set background=dark
"设置帮助文件为中文（需要安装vimcdoc文档）
set helplang=cn

"----缩进----
"回车后下一行缩进自动跟上一行保持一致
set autoindent
"按下Tab键时，Vim显示的空格数。
set tabstop=4
"缩进每一级的字符数
set shiftwidth=4
"自动将Tab转为空格
set expandtab
"Tab转为多少个空格
set softtabstop=4
"C风格缩进
set cindent
set completeopt=longest,menu
"set completeopt=preview,menu


"----外观----
"显示行号
set number
"显示光标所在行行号，其他行为相对行号。
set relativenumber
"光标所在当前行高亮
set cursorline
"设置行宽
"set textwidth=100
"自动折行
set wrap
"set nowrap
"只有遇到指定符号才折行
set linebreak
"折行处与窗口空出的字符数
set wrapmargin=2

"垂直滚动光标距离顶部底部的位置
set scrolloff=3
"水平滚动光标距离行首行尾的位置
set sidescrolloff=15
"是否显示状态栏，0不显示，1只在多窗口显示，2显示。
set laststatus=2
"在状态栏显示当前位置
set ruler
" 状态行显示的内容
set statusline=[%F]%r%m%*%=%y==[%{&encoding}:%{&ff}]Line:%l/%L,Column:%c][%p%%]

"基于缩进或者语法折叠 za,zM,zR
"set foldmethod=indent
set foldmethod=syntax
"启动时关闭折叠代码
set foldlevelstart=99

"----搜索----
"光标遇到括号自动高亮另一个括号
set showmatch
"高亮显示匹配结果
set hlsearch
"输入搜索模式时，每输入一个字符，就自动跳到第一个匹配的结果。
set incsearch
"搜索时忽略大小写
set ignorecase
"搜索Test时，将不匹配test，搜索test时，将匹配Test。
set smartcase

"----编辑----
"打开英语单词拼写检查
"set spell spelllang=en_us
"创建备份文件
if !isdirectory(expand("~/.vim/.backup"))
    call mkdir($HOME . "/.vim/.backup","p")
endif
set backupdir=~/.vim/.backup//
set backup
"创建交换文件
if !isdirectory(expand("~/.vim/.swp"))
    call mkdir($HOME . "/.vim/.swp","p")
endif
"set dir=~/.vim/swapfiles//
set directory=~/.vim/.swp//
set swapfile
"保留撤销历史
if !isdirectory(expand("~/.vim/.undo"))
    call mkdir($HOME . "/.vim/.undo","p")
endif
set undodir=~/.vim/.undo//
set undofile
"设置保持位置
"自动切换工作目录
set autochdir
"出错时不要发出响声
set noerrorbells
"出错时不要发出视觉提示
"set novisualbell
"记住多少次历史操作
set history=1000
"打开文件监视
set autoread
"行尾多余的空格显示成小方块
"set listchars=tab:»■,trail:■
"set list
"命令模式下，按Tab自动补全
set wildmenu
"set wildmenu=longest,list,full  error???
"自动保存
set autowrite
"共享剪贴板
"set clipboard+=unnamed

"快捷键
if exists ("*strftime")
    iabbrev xdate <CR>=strftime("%Y-%m-%d")<CR>
    iabbrev xtime <CR>=strftime("%H-%M-%S")<CR>
endif

"对齐
nmap <tab> v>
nmap <s-tab> v<

vmap <tab> >gv
vmap <s-tab>  <gv

"调整窗口大小
map <F11> <C-w>\|
map <F12> <C-w>=
map <C-F11> <ESC>:vertical res +5<CR>
map <C-F12> <ESC>:vertical res -5<CR>

"调试、执行
map<F7> <ESC>:w<CR>:call RunFunc('-d')<CR>
map<F8> <ESC>:w<CR>:call RunFunc('-c')<CR>
map<F9> <ESC>:w<CR>:call RunFunc('')<CR>

function! RunFunc(arg)
    if &filetype == 'perl' 
        exec "!perl "a:arg expand('%:p') 
    elseif  &filetype == 'python' 
     " 
    else
      "
    endif
endfunction

"括号匹配
imap ( ()<ESC>i
imap (<CR> (<CR>)<ESC><S-o>
imap ) <CR>=ClosePair(')')<CR>

imap [ []<ESC>i
imap [<CR> [<CR>]<ESC><S-o>
imap ] <CR>=ClosePair(']')<CR>

imap { {}<ESC>i
imap {<CR> {<CR>}<ESC><S-o>
imap } <c-r>=ClosePair('}')<CR>

function! ClosePair(char) 
    if getline('.')[col('.')-1]==a:char
          return "\<Right>"
     else
          return a:char 
     endif
endfunction


"注释
let mapleader="\<space>"
map <LEADER>// :call Note()<CR>
map <LEADER>c ^x j

func! Note()
    if &filetype == 'perl'
        normal ^i#
    endif
    if &filetype == 'csh'
        normal ^i#
    endif
    if &filetype == 'vim'
        normal ^i"
    endif
    if &filetype == 'java'
        normal ^i//
    endif
endfunc

"模版
"map <LEADER>phs :r ~/.vim/templates/phs.tpl <CR>


"perl keyword & module
"set is keyword+=:
"set complete+=k~/.vim/extras/file_perl_module
"set complete+=k~/.vim/wordlists/perl.list
"

"template
"autocmd BufNewFile *.pl 0r ~/.vim/templates/perl.tpl


"catgs
set tags=./tags
"let Tlist_Ctags_Cmd='/usr/bin/ctags'
autocmd BufWritePost *pl silent execute "! cd %:p:h && [ -d .git ] && ctags -R ."

"打开文件光标自动定位到上一次位置
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

filetype plugin indent on
