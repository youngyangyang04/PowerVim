
# PowerVim
Make your vim more power and much easer.        
```
  _____                    __      ___           
  |  __ \                   \ \    / (_)          
  | |__) |____      _____ _ _\ \  / / _ _ __ ___  
  |  ___/ _ \ \ /\ / / _ \ '__\ \/ / | | '_ ` _ \ 
  | |  | (_) \ V  V /  __/ |   \  /  | | | | | | | 
  |_|   \___/ \_/\_/ \___|_|    \/   |_|_| |_| |_|
```
# Why PowerVim?
* Highly customizble
* Runs everywhere
* Works with many programming language
* Scriptable
# Overview
![conv_ops](https://github.com/youngyangyang04/Documents/blob/master/vim/vim_overview.gif)

# Installation
```bash
git clone https://github.com/youngyangyang04/PowerVim.git
cd PowerVim
sh install.sh
```
# Uninstall

```bash
sh uninstall.sh
```

# Feature
* CPP/PHP/JAVA code completion and you can add code keyword list for any language completion
* Taglist for functuon and variables list
* MiniBufList shows the files opened
* Vim syntax highlighting for C++ (including C++11), go, php, html, json and markdown
* Shows a git diff in the 'gutter' (sign column).  It shows which lines have been added, modified, or removed.
* Provides an overview of the structure of the programming language files
* Automatically opens popup menu for completions when you enter characters or move the cursor in Insert mode
* Comment stuff out.  Use `gcc` to comment out a line (takes a count), `gc` to comment out the target of a motion
* Visually browse complex directory hierarchies, quickly open files for reading or editing, and perform basic file system operations.
* Search with ack from within Vim and shows the results in a split window
* Syntastic checker for almost every programming language
* Beautiful statusline

# Usage
PowerVim shortcuts start with ;
Shortcuts is designed for mac Keyboard, more convenient and comfortable. Of course normal Keyboard can also use it Conveniently.

```
Normal Model Keyboard Shortcuts
;n              // Open directory tree
;m              // Open file function and variables list
;w              // Save file
;u              // Up half screen
;d              // Down half screen
;1              // Move cursor to head of line 
;2              // Move cursor to end of line 
;a              // Switch between source files and header files quickly, suport for C, C++
;e              // Open a new file
;z              // Switch to the shell interface，and "fg" go back
;s              // Horizontal separation of window
;v              // Vertical separation of window
;fw             // Search keyword around the project, make sure you have installed ack
;ff             // Search filename around the project
;gt             // Jump to the definition of the keyword where the cursor is located, but make sure you have make ctags
;gr             // Go back for ";gt"
;tg             // Take tags file, make sure already install ctags
;y              // Copy content which selected by v to system clipboard
;o              // Enable syntastic checker
;t              // Align with symbol, for example: ":Tab /|"  
;ja             // Add setter and getter for jave class 
dsfa;w
// It is useful when you have serval window because of tagbar or neadtree or split the window
;h/l/k/j        // Move to the left/right/top/bottom window accordingly
;gg             // Traverse window

// Shortcuts without ;
e               // Delete word under cursor
tabc            // Close tab, of course you should :tabnew a file first. 
F1              // Compile cpp code, and make sure there is a diretory named "bin" in current directory.
gc              // Comment out the target of a motion
gcc             // Comment out a line (takes a count)
{               // Up block of code 
}               // Down block of code
di+(            // Delete the content in the parentheses
```

# Plugins

* [a.vim](https://github.com/vim-scripts/a.vim)
* [minibufexpl.vim](https://github.com/fholgado/minibufexpl.vim)
* [statusline.vim](https://github.com/youngyangyang04/PowerVim/blob/master/.vim/plugin/statusline.vim)
* [taglist.vim](https://github.com/vim-scripts/taglist.vim)
* [ack](https://github.com/mileszs/ack.vim)
* [autocomplpop](https://github.com/vim-scripts/AutoComplPop)
* [commentary](https://github.com/tpope/vim-commentary)
* [nerdtree](https://github.com/scrooloose/nerdtree) 
* [vim-gitgutter](https://github.com/airblade/vim-gitgutter)
* [Tabular](https://github.com/godlygeek/tabular)
* [vim-syntastic](https://github.com/vim-syntastic/syntastic)
* [vim-javacomplete2](https://github.com/artur-shaik/vim-javacomplete2)

# Configuration

Every one can change this config to make PowerVim for youself

* Change shortcuts by modifying .vimrc 
* You can add language completion by puting language keyword list file in .vim/dictionary, and modify .vimrc

# FAQ

PowerVim do not install youcompleteme to perfect code completion

* PowerVim basic code completion is enough
* Installing youcompleteme is complicated and is not almost universal, one install successfully do not mean other people can install it successfully in same operation method.
* Open vim will be slow. Because youcompleteme is to large, it load bin file and analyze syntax.
* PowerVim will try it latter, if it is easy to install and use.

# Todo

* Check whether ctags are installed when installing PowerVim
* Check directory bin when Compiling CPP

# Vim inside Shortcuts
## Easy shortcuts

``` 
u               // Undo
r               // Relace the character under cursor
ctrl r          // Cancel undo
>>              // Right Indent
<<              // Left Indent
:noh            // Cancel highlight
ctrl e          // Scroll the window down 
ctrl y          // Scroll the window up 
ctrl f          // Scroll down one page
ctrl b          // Scroll up one page
ctrl d          // Scroll down half of page
ctrl u          // Scroll up half of page
H               // Move cursor to the top of the window
M               // Move cursor to the middle of the window 
L               // Move cursor to the bottom of the window
G               // Go to bottom of file
gg              // Go to top of file 
:echo           // Print variables in vim 
:call           // Call vimshell function
:%!xxd          // View the assembly code for this file 
:scriptnames    // List all plugin files loaded
:!unix_command  // Run Unix commands inside vim
:pwd            // The present working directory can be displayed in Vim with 
:cd %:p:h       // To change to the directory of the currently open file
:reg            // Show register
```

## Complicated shortcuts

Comment quickly

* First, go to the first line you want to comment, press CtrlV. This will put the editor in the VISUAL BLOCK mode.
* Then using the arrow key and select until the last line
* Now press ShiftI, which will put the editor in INSERT mode and then press #. This will add a hash to the first line.
* Then press Esc (give it a second), and it will insert a # character on all other selected lines.

Relace oldName to newName in Visual model selected 

* select block in Visual model, then press :,  :'<,'>s/oldName/newName/g

## Neadtree

```
C               // The root directory is the directory where the cursor is currently located 
go              // Previews the file where the cursor is, and the cursor does not jump to the file 
m               // Open a menu below and you can select from a list of actions, such as create file, delete file, copy file and soon  
r               // Refresh 
x               // Close the current nodes parent
```
# NOTIFY 

some file is gone, you shuild go origial place to download it.
