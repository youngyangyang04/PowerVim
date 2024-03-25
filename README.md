# [English Version](./docs/README-en.md)

# PowerVim

这套vim配置我已经打磨了将近四年，不断调整优化，已经可以完全满足工业级打开的需求了。所以我给它起名为PowerVim，一个真正强大的vim。

```
  _____                    __      ___           
  |  __ \                   \ \    / (_)          
  | |__) |____      _____ _ _\ \  / / _ _ __ ___  
  |  ___/ _ \ \ /\ / / _ \ '__\ \/ / | | '_ ` _ \ 
  | |  | (_) \ V  V /  __/ |   \  /  | | | | | | | 
  |_|   \___/ \_/\_/ \___|_|    \/   |_|_| |_| |_|
```
# 预览

来感受一下PowerVim的使用体验，看起来很酷吧！注意这些操作都不用鼠标的，一波键盘控制流！所以我平时写代码是不碰鼠标的！

![conv_ops](https://github.com/youngyangyang04/Documents/blob/master/vim/vim_overview.gif)

# 安装

PowerVim的安装非常简单，我已经写好了安装脚本，只要执行以下就可以安装，而且不会影响你之前的vim配置，之前的配置都给做了备份，大家看一下脚本就知道备份在哪里了。

安装过程非常简单。如下三行命令：

```bash
git clone https://github.com/youngyangyang04/PowerVim.git
cd PowerVim
bash install.sh
```


在按照的过程中 ubuntu 操作系统 会出现 这样的问题`Syntax error: "(" unexpected`，是系统语言问题，看本项目上方issue，已经给出解决办法


# 特性

* CPP、PHP、JAVA代码补全，如果需要其他语言补全，可自行配置关键字列表在PowerVim/.vim/dictionary目录下
* 显示文件函数变量列表
* MiniBuf显示打开过的文件
* 语法高亮支持C++ (including C++11), go,java, php, html, json and markdown
* 显示git状态，和主干或分支的添加修改删除的情况
* 显示项目文件目录，方便快速打开
* 快速注释，使用gcc注释当前行，gc注释选中的块
* 项目内搜索关键字和文件夹
* 漂亮的颜色搭配和状态栏显示

# 使用方法
PowerVim的快捷键以;为开始
这里列出的快捷键是PowerVim配置的，vim通用的快捷键就不一一列出。
```
正常模式下的快捷键（非插入模式）
;n              // 打开文件目录树显示在屏幕左侧
;m              // 打开当前函数和变量目录树显示在屏幕右侧
;h              // 光标移动到左窗口 
;l              // 光标移动到右窗口
;k              // 光标移动到上窗口
;j              // 光标移动到下窗口 以上四个快捷键特别是打开多个窗口情况下。使用这个快捷键组合非常实用
;w              // 保存文件
;u              // 向上翻半屏
;d              // 向下翻半屏
;1              // 光标快速移动到行首
;2              // 光标快速移动到行末
;a              // 快速切换.h和cpp文件，写C++的时候很方便
;e              // 打开一个新文件
;z              // 切回shell交互命令，输入fg在切回vim，非常实用
;s              // 水平分屏，并打开文件目录选取想打开的文件，如果想新建文件，;e 就好 
;v              // 竖直分屏，并打开文件目录选取想打开的文件，如果想新建文件，;e 就好 
;fw             // 查找项目内关键字，前提是你的系统已经按照了ACK 
;ff             // 查找项目内文件名 
;gt             // 跳转到变量或者函数定义的地方，前提是安装ctags，并且在在PowerVim输入 ;tg命令 Jump to the definition of the keyword where the cursor is located, but make sure you have make ctags
;gr             // 跳回，对应着;gt
;tg             // 对当前目录打ctag 
;y              // 保存当前选中的目录到系统剪切板，前提是vim支持系统剪切板的寄存器
;gg             // 按顺序光标跳转各个窗口

// 一下快捷键是不用;的，直接在 非插入模式 下输入
e               // 快速删除光标所在的词 
tabc            // 关闭当前tab，可以用:tabnew来打开一个新的tab Close tab, of course you should :tabnew a file first. 
F1              // 编译并运行C++文件，自己写的C++例子的时候一键编译。前提手动在当前目录建一个bin文件夹，这是用来存放编译产生的执行文件 
F1              // 编译Java文件
F2              // 运行Java编译的class文件，一般如果要编译并运行Java文件 按F1编译，在按F2运行
gc              // 快速注释选中的块（是visual模式下选中的块） 
gcc             // 快速当前行
{               // 光标向上移动一个代码块
}               // 光标向下移动一个代码块
di(             // 删除括号里的内容
di{             // 删除花括号里的内容
```
# 插件
* a.vim [https://github.com/vim-scripts/a.vim](https://github.com/vim-scripts/a.vim)
* minibufexpl.vim [https://github.com/fholgado/minibufexpl.vim](https://github.com/fholgado/minibufexpl.vim)
* statusline.vim [https://github.com/youngyangyang04/PowerVim/blob/master/.vim/plugin/statusline.vim](https://github.com/youngyangyang04/PowerVim/blob/master/.vim/plugin/statusline.vim)
* taglist.vim [https://github.com/vim-scripts/taglist.vim](https://github.com/vim-scripts/taglist.vim)
* ack [https://github.com/mileszs/ack.vim](https://github.com/mileszs/ack.vim)
* autocomplpop [https://github.com/vim-scripts/AutoComplPop](https://github.com/vim-scripts/AutoComplPop)
* commentary [https://github.com/tpope/vim-commentary](https://github.com/tpope/vim-commentary)
* nerdtree [https://github.com/scrooloose/nerdtree](https://github.com/scrooloose/nerdtree) 
* vim-gitgutter [https://github.com/airblade/vim-gitgutter](https://github.com/airblade/vim-gitgutter)

# 配置
每个人都可以在这个基础上进行修改，改成一个属于自己的PowerVim
* 改变快捷键的方式在.vimrc
* 可以添加支持代码补全的语言，你可以在.vim/dictionary文件下添加该编程语言的补全关键字文本，并且在.vimrc上添加一下dict

# 疑问解答
PowerVim没有安装youcompleteme来完善代码补全，主要有以下方面
* PowerVim已经有很好的代码补全，足够开发使用 
* 安装youcompleteme比较麻烦，而且不通用，就是我安装成功，你按照一样的步骤安装并不一定成功 
* 安装youcompleteme后，vim会变得比较慢 
* PowerVim 后面也会尝试加上youcompleteme，可以让这个插件可以简单的被安装 

# 关于作者

大家好，我是程序员Carl，哈工大师兄，[《代码随想录》](https://programmercarl.com/other/publish.html)作者，先后在腾讯和百度从事分布式技术研发工作。 

* [代码随想录网站](https://programmercarl.com)
* [代码随想录Github](https://github.com/youngyangyang04/leetcode-master)
* [代码随想录算法公开课](https://www.bilibili.com/video/BV1fA4y1o715)





