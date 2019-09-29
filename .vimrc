"-----------------------------------------------------------------------"
"----------------------------About Plug-in------------------------------"
"-----------------------------------------------------------------------"


"****************************Plug-ins' list*****************************"

call plug#begin('~/.vim/plugged')
Plug 'LuoshuiTianyi/vim-softera'
Plug 'logico-software/typewriter'
Plug 'ayu-theme/ayu-vim'
let ayucolor="light"
Plug 'reedes/vim-colors-pencil'
Plug 'rakr/vim-one'
Plug 'kaicataldo/material.vim'
let g:material_theme_style='lighter'
                         " Vim 配色'
Plug 'LuoshuiTianyi/Vim-startify'
                         " 启动界面
Plug 'liuchengxu/eleline.vim'
                         " 状态栏插件
Plug 'rhysd/vim-clang-format'
                         " 代码格式化
Plug 'yianwillis/vimcdoc'
                         " 中文文档
Plug 'vim-scripts/fcitx.vim'
                         " 智能输入法切换
Plug 'godlygeek/tabular'

Plug 'plasticboy/vim-markdown'
                         " markdown语法高亮
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
                         " markdown预览

call plug#end()            

"**************************Plug-in Settings*****************************"

"############################# eleline #################################"
set laststatus=2
let g:eleline_powerline_fonts = 1
"########################### clang-format ##############################"
let g:clang_format#command = 'clang-format'
autocmd FileType c ClangFormatAutoEnable
source ~/Vim/.vimrc_clang-format
"############################# markdown ################################"
let g:vim_markdown_math = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_new_list_item_indent = 2


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
set guifont=Ligalex\ Mono\ 14
                         " 设置 gvim 字体
set makeprg=g++\ ./%\ -o\ ./%<
                         " 设置 make
let g:netrw_liststyle = 1
                         " netrw 显示文件详细信息
let g:netrw_banner = 0   " netrw 上方横幅不显示


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
color softera            " 颜色主题


"-----------------------------------------------------------------------"
"-----------------------------Init Settings-----------------------------"
"-----------------------------------------------------------------------"


autocmd BufNewFile *.cpp :0r ~/Template/template.cpp
autocmd BufNewFile *.py :0r ~/Template/template.py
autocmd BufNewFile check.sh :0r ~/Template/template_check.sh
autocmd BufEnter * cd %:p:h


"-----------------------------------------------------------------------"
"----------------------------Shortcut Keys------------------------------"
"-----------------------------------------------------------------------"


"****************************About Leader*******************************"

let mapleader = " "      " 定义<leader>键
nmap <leader>i :PlugInstall<cr>
                 " 安装插件
nmap <leader>u :PlugUpdate<cr>
                 " 更新插件
nmap <leader>d :PlugClean<cr>
                         " 删除插件
noremap <leader>y "+y
                         " 复制
noremap <leader>p "+p
                         " 粘贴
nmap <leader>c :tabe ~/Vim/.vimrc<CR>
                         " 快速打开配置文件

"***********************Usual Key Combinations**************************"

noremap <c-h> 10h
noremap <c-l> 10l
noremap <c-j> 5gj
noremap <c-k> 5gk
                         " 快速移动
noremap K kJ

noremap <c-n> :tabe .<CR>
noremap <m-1> 1gt
noremap <m-2> 2gt
noremap <m-3> 3gt
noremap <m-4> 4gt
noremap <m-5> 5gt
noremap <m-6> 6gt
noremap <m-7> 7gt
noremap <m-8> 8gt
noremap <m-9> 9gt
noremap <m-0> 10gt
noremap <leader><leader> gt
                          " 标签页操作

"************************One Button Functions***************************"

nmap <F5> :ClangFormat<cr>
                         " 格式化代码
nmap <leader>s :source ~/.vimrc<CR>
                         " 刷新配置
nmap <F8> :vs %<.out<cr>:sp %<.in<cr>
                         " F8打开输入输出文件
nmap <F9> :call CompareRun()<CR>
func! CompareRun()
  exec "w"
  if (&filetype == 'cpp')
    exec 'make'
    exec 'cw'
    exec '!time ./%<'
  elseif (&filetype == 'tex')
    exec '!xelatex ./%'
  elseif (&filetype == 'sh')
    exec '!chmod +x ./%'
    exec '!bash ./%'
  elseif (&filetype == 'python')
    exec '!chmod +x ./%'
    exec '!python3 ./%'
  endif
endfunc
nmap <leader><F9> :w<CR>:!g++ % -o %< -O2 -std=c++11<CR>:!time ./%<<CR>


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
