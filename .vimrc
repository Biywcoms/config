"-----基础配置----
"去掉有关vi一致性模式，避免以前版本的一些bug和局限，解决backspace不能使用的问题
set nocompatible
set backspace=indent,eol,start
set backspace=2
"语法高亮
syntax on
"底部显示模式类型
set showmode
"显示命令
set showcmd
"使用鼠标
set mouse=a
"使用utf-8编码
set encoding=utf-8
"启用256色
set t_Co=256
"开启文件类型检查载入相应的缩进规则
filetype on
filetype plugin on
filetype indent on
"配色方案
colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1
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

"----外观----
"显示行号
set number
"显示光标所在行行号，其他行为相对行号。
set relativenumber
"光标所在当前行高亮
set cursorline
"设置行宽
set textwidth=100
"自动折行
set wrap
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
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}

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
"不创建备份文件
set nobackup
"不创建交换文件
set noswapfile
"保留撤销历史
set undofile
"设置保持位置
"set backupdir=~/.vim/.backup//
"set directory=~/.vim/.swp//
"set undodir=~/.vim/.undo//
"自动切换工作目录
set autochdir
"出错时不要发出响声
set noerrorbells
"出错时不要发出视觉提示
set novisualbell
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

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-surround'      "括号操作
Plugin 'scrooloose/nerdtree'     "侧栏
Plugin 'Lokaltog/vim-powerline'  "状态栏
Plugin 'Valloric/YouCompleteMe'  "代码提示
"Plugin 'Yggdroot/indentLine'     "缩进指示线
Plugin 'jiangmiao/auto-pairs'    "括号
Plugin 'fatih/vim-go'
Plugin 'SirVer/ultisnips'        "vim插件
"""""""""""plugin configuration"""""""""""""""""""
"vim-go settings
let g:go_fmt_command = "goimports"
map <C-b> <ESC>:GoRun<CR>
"NERDTree
"F2开启和关闭树"
map <F2> :NERDTreeToggle<CR>
let NERDTreeChDirMode=1
""显示书签"
let NERDTreeShowBookmarks=0
"设置忽略文件类型";
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
""窗口大小"
let NERDTreeWinSize=25
"indentLine
"缩进指示线"
"let g:indentLine_char='|'
"let g:indentLine_enabled=1
" 补全菜单的开启与关闭
set completeopt=longest,menu                    " 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
let g:ycm_min_num_of_chars_for_completion=2             " 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0                      " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_autoclose_preview_window_after_completion=1       " 智能关闭自动补全窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif         " 离开插入模式后自动关闭预览窗口

" 补全菜单中各项之间进行切换和选取：默认使用tab  s-tab进行上下切换，使用空格选取。可进行自定义设置：
"let g:ycm_key_list_select_completion=['<c-n>']
"let g:ycm_key_list_select_completion = ['<Down>']      " 通过上下键在补全菜单中进行切换
"let g:ycm_key_list_previous_completion=['<c-p>']
"let g:ycm_key_list_previous_completion = ['<Up>']
"let g:ycm_key_invoke_completion = '<C-Space>'

" 开启各种补全引擎
let g:ycm_collect_identifiers_from_tags_files=1         " 开启 YCM 基于标签引擎
let g:ycm_auto_trigger = 1                  " 开启 YCM 基于标识符补全，默认为1
let g:ycm_seed_identifiers_with_syntax=1                " 开启 YCM 基于语法关键字补全
let g:ycm_complete_in_comments = 1              " 在注释输入中也能补全
let g:ycm_complete_in_strings = 1               " 在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0 " 注释和字符串中的文字也会被收入补全
" 跳转到定义处
"nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> 
let g:ycm_confirm_extra_conf=0                  " 关闭加载.ycm_extra_conf.py确认提示

"UltiSnips setting
let g:UltiSnipsExpandTrigger="<c-t>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

call vundle#end()
filetype plugin indent on
