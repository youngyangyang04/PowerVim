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
# Overview
![conv_ops](https://github.com/youngyangyang04/Documents/blob/master/vim/vim_overview.gif)

# Installation
```bash
git clone https://github.com/youngyangyang04/PowerVim.git
cd PowerVim
ssh install.sh
```
# Feature
CPP and PHP code completion and you can add code lib for any language completion
# Usage
PowerVim shortcuts start with ;
Shortcuts is designed for mac Keyboard, more convenient and comfortable. Of course normal Keyboard can also use it Conveniently.
```
Normal Status Keyboard Shortcuts
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
;fw             // Search keyword around the project
;ff             // Search filename around the project
;gt             // Jump to the definition of the keyword where the cursor is located, but make sure you have make ctags
;gr             // Go back for ";gt"

// It is useful when you have serval window because of tagbar or neadtree or split the window
;h/l/k/j        // Move to the left/right/top/bottom window accordingly
;gg             // Traverse window

;tg             // Take tags file, make sure already install ctags
;y              // Copy content which selected by v to system clipboard

// Shortcuts without ;
e               // Delete word under cursor
tabc            // Close tab, of course you should :tabnew a file first. 
F1              // Compile cpp code, and make sure there is a diretory named "bin" in current directory.
```
# Configuration
Every one can change this config to make PowerVim for youself
Code completion config way
