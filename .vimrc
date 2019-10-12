source ~/Vim/.vimrc.status

source ~/Vim/.vimrc.plugin

set completeopt=menu
set tags+=tags
set tags+=/home/.vim/tag/tags
                         
"-----------------------------------------------------------------------"
"----------------------------Basic Settings-----------------------------"
"-----------------------------------------------------------------------"


set nocompatible         " 设置不兼容原始vi模式
set vb t_vb=             " 关闭错误提示音
au GuiEnter * set t_vb=  " 关闭错误闪烁
set backspace=indent,eol,start
                         " 允许删除换行符
set mouse=a              " 开启鼠标支持
set history=2000         " 历史ex命令记录上限提高
set showtabline=2        " 显示标签页栏
filetype on              " 设置文件类型检测
set go=                  " gvim 关闭菜单栏
set guifont=Fira\ Code\ 14
                         " 设置 gvim 字体
set makeprg=g++\ ./%\ -o\ ./%<
                         " 设置 make
let g:netrw_liststyle = 3
                         " netrw 显示文件详细信息
let g:netrw_banner = 0   " netrw 上方横幅不显示
let g:netrw_hide = 1
let g:netrw_browse_split = 4
let g:netrw_winsize = 18
let g:netrw_altv = 1
let g:netrw_chgwin = 2


"-----------------------------------------------------------------------"
"--------------------------Functional Settings--------------------------"
"-----------------------------------------------------------------------"


set ruler                " 总是显示光标位置
set number               " 开启行号显示
set whichwrap+=<,>,h,l   " 设置光标键跨行
set virtualedit=block,onemore
                         " 允许光标出现在最后一个字符的后面
set ttimeoutlen=0        " 设置<ESC>键响应时间
set wildmenu             " 开启zsh支持
set wildmode=full        " zsh补全菜单


"-----------------------------------------------------------------------"
"-------------------------Physiognomic Settings-------------------------"
"-----------------------------------------------------------------------"


syntax on                " 自动语法高亮
set cursorline           " 高亮显示当前行
highlight CursorLine   cterm=NONE ctermbg=255 guibg=NONE guifg=NONE
                         " 高亮显示当前行具体设置
set fillchars=vert:\ ,stl:\ ,stlnc:\
                         " 在分割窗口间留出空白
set t_Co=256             " 开启256色支持
if (has("termguicolors"))
   set termguicolors
endif                    " 色彩显示支持
color onedark            " 颜色主题


"-----------------------------------------------------------------------"
"-----------------------------Init Settings-----------------------------"
"-----------------------------------------------------------------------"


autocmd BufNewFile *.cpp :0r ~/Template/template.cpp
autocmd BufNewFile check.sh :0r ~/Template/template_check.sh
autocmd BufEnter * cd %:p:h


source ~/Vim/.vimrc.shortcut


"-----------------------------------------------------------------------"
"----------------------------Coding Settings----------------------------"
"-----------------------------------------------------------------------"


"****************************Format Settings****************************"

set autoindent           " 设置自动缩进
set cindent              " 设置使用C/C++语言的自动缩进方式
set cinoptions=g0,:0,N-s,(0
                         " 设置C/C++语言的具体缩进方式
set tabstop=2            " 设置制表符长度为两个空格
set expandtab            " 设置制表符自动转化为空格
set shiftwidth=2         " 设置格式化时制表符占用空格数
set backspace=2          " 使用回车键正常处理indent,eol,start等

"***************************Search Settings*****************************"

set incsearch            " 实时搜索

"***************************Cache Settings******************************"

set nobackup             " 设置不备份
set noswapfile           " 禁止生成临时文件
set autoread             " 文件在vim之外修改过，自动重新读入
set confirm              " 在处理未保存或只读文件的时候，弹出确认
