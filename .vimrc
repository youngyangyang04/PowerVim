" 定义快捷键的前缀，即<Leader>
let mapleader=";"

" pathogen plugin manager
execute pathogen#infect()
" syntax on
filetype plugin indent on

" ack搜索时不打开第一个搜索文件
map <Leader>fw :Ack!<Space>
" AckFile不打开第一个搜索文件
map <Leader>ff :AckFile!<Space>

"高亮搜索关键词"
let g:ackhighlight = 1
"修改快速预览窗口高度为15
let g:ack_qhandler = "botright copen 15"
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
"set autocmd
set autoindent		" always set autoindenting on 自动缩进
" indent C++ autoindent private public keyword 
set cindent
set cinoptions=g-1
"if has("vms")
"  set nobackup		" do not keep a backup file, use versions instead
"else
"  set backup		" keep a backup file
"endif
set nobackup        "I hate backup files.
set number
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
"设置非兼容模式
set nocp

"set encoding=utf-8
""set encoding=gb2312
set langmenu=zh_CN.gb2312
language message zh_CN.gb2312

set fileencoding=gbk2312
set ts=4
set sw=4
set smartindent
set showmatch        " Show matching brackets.
set guioptions-=T
set expandtab

let curpwd = getcwd()
" vim自身命令行模式智能补全
set wildmenu

" 禁止光标闪烁
set gcr=a:block-blinkon0

" 定义快捷键 关闭当前分割窗口
" nmap <Leader>q :q<CR>
" 定义快捷键
nmap <Leader>w :w<CR>
" 删除光标所在单词
nmap e daw
" close TAB
nmap tabc :tabc <CR>
" 定义快捷键 跳转到光标所在关键词的定义处
nmap <Leader>gt <C-]>
" 定义快捷键 跳回原关键词 与 ;gr 配合使用
nmap <Leader>gr <C-T>
" 向下翻半屏
nmap <Leader>u <C-U>
" 向上翻半屏
nmap <Leader>d <C-D>
" 快速移动到行首，行尾
map <Leader>1 ^
map <Leader>2 $
" 补全提示
""nmap <Leader>p <C-P>
" 快速切换C H源文件
nmap <Leader>a :A<CR>
"快速切换到上一个文件
" nmap <Leader>j :bn<CR>
" nmap <Leader>k :bp<CR>
nmap <Leader>k <C-W><C-K>
"快速切换到下一个文件
nmap <Leader>j <C-W><C-J>
" 设置快捷键gs遍历各分割窗口。快捷键速记法：goto the next spilt window
nnoremap <Leader>gg <C-W><C-W>
" 向左
nnoremap <leader>h <C-W><C-H>
" 向右
nnoremap <leader>l <C-W><C-L>
" 切换到shell，vim在后台运行
nmap <Leader>gs :shell<CR>
" 去除高亮
"nmap <Leader>h :noh<CR>
" 打开文件
nmap <Leader>e :e<Space>
" 不关闭文件推出
nmap <Leader>z <C-Z>
" 水平分隔
nmap <Leader>s :Sex<CR>
" 竖直分隔
nmap <Leader>v :Vex<CR>
" 全局替换
nmap <Leader>r :%s/[fileName-]/[fileName+]/g
" 打tag
nmap<leader>tg :!ctags -R<CR>

" 使用NERDTree插件查看工程文件。设置快捷键
nnoremap <silent> <Leader>n  :NERDTreeToggle <CR> 
" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"
" 设置忽略的文件
let NERDTreeIgnore=['\.vim$', '\~$', '\.o$', '\.d$', '\.a$', '\.out$', '\.tgz$']

" 使用TlistToggle查看文件函数列表。设置快捷键：<F12>
nnoremap  <Leader>m  :TlistToggle <CR> 
"禁止自动改变当前Vim窗口的大小
let Tlist_Inc_Winwidth=0
"把方法列表放在屏幕的右侧
let Tlist_Use_Right_Window=1
"让当前不被编辑的文件的方法列表自动折叠起来
let Tlist_File_Fold_Auto_Close=1

" let g:winManagerWindowLayout='FileExplorer'
" 定义快捷键 打开/关闭 winmanger
" nmap wm :WMToggle<cr>
" let g:winManagerWidth=20
" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on
" 根据侦测到的不同类型采用不同的缩进格式
filetype indent on

" 取消补全内容以分割子窗口形式出现，只显示补全列表
" set completeopt=longest,menu

"cs add $curpwd/cscope.out $curpwd/
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-O>"
set cscopequickfix=s-,c-,d-,i-,t-,e-


" VIM支持多种文本折叠方式，我VIM多用于编码，所以选择符合编程语言语法的代码折叠方式。
" set foldmethod=syntax
" 启动vim时打开所有折叠代码。
set nofen

let cwd=""
set tags=tags
"cs add cscope.out 
let g:miniBufExplMapWindowNavArrows = 1
"允许光标在任何位置时用CTRL-TAB遍历buffer
let g:miniBufExplMapCTabSwitchBufs = 1

"设置winmanager窗口宽度
"let g:winManagerWidth = 30 

" 重新打开文档时光标回到文档关闭前的位置
if has("autocmd")
 autocmd BufReadPost *
 \ if line("'\"") > 0 && line ("'\"") <= line("$") |
 \ exe "normal g'\"" |
\ endif
endif


"花括号自动格式化，首行一个tab
inoremap { {<CR>}<ESC>kA<CR>
inoremap { {<CR>}<ESC>kA<CR>
set fenc=" "
"显示匹配
set showmatch
"括号匹配
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
set selectmode=mouse,key
set selection=exclusive
set mouse=n "可视模式下使用鼠标，set mouse=a这个命令导致在vim下复制粘贴不好用
set ai "vim中复制粘贴保存格式
set ignorecase "设置默认大小写不敏感查找
set smartcase "如果有大小写字母，则切换到大小写敏感查找
set tags=tags;/ "告诉在每个目录下如果找不到tags就到上一层目录去找
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" Smart way to move between windows
" map <C-j> <C-W>j
" map <C-k> <C-W>k
" map <C-h> <C-W>h
" map <C-l> <C-W>l

set ruler           " 显示标尺"
autocmd InsertEnter * se cul    " 用浅色高亮当前行"
set shortmess=atI   " 启动的时候不显示那个援助乌干达儿童的提示

" :colorscheme desert     " 设置主题
" vim-commentary style set 注释针对不同语言的注释方法
autocmd FileType cpp set commentstring=//\ %s
autocmd FileType php set commentstring=//\ %s
" set modeline
set modeline
" 搜索关键词高亮
set hlsearch
" 开启语义分析
syntax enable
syntax on
" 使用ctrlc, v就可以实现vim之间的复制粘贴
vnoremap <C-c> :w! ~/tmp/clipboard.txt <CR>
inoremap <C-v> <Esc>:r ~/tmp/clipboard.txt <CR>
" 将 Vim 设置为粘贴模式后再进行粘贴
autocmd filetype python nnoremap <F4> :w <bar> exec '!python '.shellescape('%')<CR>
autocmd filetype c nnoremap <F4> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype cpp nnoremap <F4> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
" set t_Co=256
" set guifont=Consolas:h13
" autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:tlist_markdown_settings = 'markdown;h:Headlins'
"新建.c,.h,.sh,.Java文件，自动插入文件头
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.Java,*.go exec ":call SetTitle()"
"""定义函数SetTitle，自动插入文件头
func SetTitle()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1,"\#########################################################################")
        call append(line("."),   "\# File Name:    ".expand("%"))
        call append(line(".")+1, "\# Author:       sunxiuyang")
        call append(line(".")+2, "\# mail:         sunxiuyang04@gmail.com")
        call append(line(".")+3, "\# Created Time: ".strftime("%c"))
        call append(line(".")+4, "\#########################################################################")
        call append(line(".")+5, "\#!/bin/bash")
        call append(line(".")+6, "")
    else
        call setline(1, "/*************************************************************************")
        call append(line("."),   "> File Name:     ".expand("%"))
        call append(line(".")+1, "> Author:        sunxiuyang")
        call append(line(".")+2, "> Mail:          sunxiuyang04@gmail.com ")
        call append(line(".")+3, "> Created Time:  ".strftime("%c"))
        call append(line(".")+4, "> Description:   ")
        call append(line(".")+5, " ************************************************************************/")
        call append(line(".")+6, "")
    endif
    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc
" 使用的背景主题
colorscheme Monokai_Gavin
" test
" 自动已当前文件为根目录
set autochdir
