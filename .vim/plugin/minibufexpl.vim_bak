" Mini Buffer Explorer <minibufexpl.vim>
"
" HINT: Type zR if you don't know how to use folds
"
" Script Info and Documentation  {{{
"=============================================================================
"     Copyright: Copyright (C) 2002 & 2003 Bindu Wavell
"                Copyright (C) 2010 Oliver Uvman
"                Copyright (C) 2010 Danielle Church
"                Copyright (C) 2010 Stephan Sokolow
"                Copyright (C) 2010 & 2011 Federico Holgado
"                Permission is hereby granted to use and distribute this code,
"                with or without modifications, provided that this copyright
"                notice is copied with it. Like anything else that's free,
"                minibufexpl.vim is provided *as is* and comes with no
"                warranty of any kind, either expressed or implied. In no
"                event will the copyright holder be liable for any damamges
"                resulting from the use of this software.
"
"  Name Of File: minibufexpl.vim
"   Description: Mini Buffer Explorer Vim Plugin
" Documentation: See minibufexpl.txt
"
"=============================================================================
" }}}
"
" Startup Check
"
" Has this plugin already been loaded? {{{
"
if exists('loaded_minibufexplorer')
  finish
endif
let loaded_minibufexplorer = 1

" }}}
"
" Mappings and Commands
"
" MBE commands {{{
"
if !exists(':MiniBufExplorer')
  command! MiniBufExplorer echoe 'MiniBufExplorer is depreciated, please use MBEOpen instead.'
endif
if !exists(':CMiniBufExplorer')
  command! CMiniBufExplorer echoe 'CMiniBufExplorer is depreciated, please use MBEClose instead.'
endif
if !exists(':TMiniBufExplorer')
  command! TMiniBufExplorer echoe 'TMiniBufExplorer is depreciated, please use MBEToggle instead.'
endif
if !exists(':MBEFocus')
  command! MBEFocus           call <SID>FocusExplorer()
endif
if !exists(':MBEFocusAll')
  command! MBEFocusAll        tabdo call <SID>FocusExplorer()
endif
if !exists(':MBEOpen')
  command! -bang MBEOpen      let t:skipEligibleBuffersCheck = 1 | if '<bang>' == '!' | call <SID>StopExplorer(0) | endif | call <SID>StartExplorer(bufnr("%"))
endif
if !exists(':MBEOpenAll')
  command! -bang MBEOpenAll   tabdo let t:skipEligibleBuffersCheck = 1 | if '<bang>' == '!' | call <SID>StopExplorer(0) | endif | call <SID>StartExplorer(bufnr("%")) | let s:TabsMBEState = 1
endif
if !exists(':MBEClose')
  command! -bang MBEClose     let t:skipEligibleBuffersCheck = 0 | call <SID>StopExplorer('<bang>' == '!')
endif
if !exists(':MBECloseAll')
  command! -bang MBECloseAll  tabdo let t:skipEligibleBuffersCheck = 0 | call <SID>StopExplorer('<bang>' == '!') | let s:TabsMBEState = 0
endif
if !exists(':MBEToggle')
  command! -bang MBEToggle    call <SID>ToggleExplorer(0,'<bang>'=='!')
endif
if !exists(':MBEToggleAll')
  command! -bang MBEToggleAll call <SID>ToggleExplorer(1,'<bang>'=='!')
endif
if !exists(':MBEToggleMRU')
  command! -bang MBEToggleMRU       call <SID>ToggleMRU()
endif
if !exists(':MBEToggleMRUAll')
  command! -bang MBEToggleMRUAll    tabdo call <SID>ToggleMRU()
endif
if !exists(':MBEbn')
  command! MBEbn call <SID>CycleBuffer(1)
endif
if !exists(':MBEbp')
  command! MBEbp call <SID>CycleBuffer(0)
endif
if !exists(':MBEbf')
  command! MBEbf call <SID>CycleBuffer(1,1)
endif
if !exists(':MBEbb')
  command! MBEbb call <SID>CycleBuffer(0,1)
endif
if !exists(':MBEbd')
  command! -bang -nargs=* MBEbd call <SID>DeleteBuffer(0,'<bang>'=='!',<f-args>)
endif
if !exists(':MBEbw')
  command! -bang -nargs=* MBEbw call <SID>DeleteBuffer(1,'<bang>'=='!',<f-args>)
endif
if !exists(':MBEbun')
  command! -bang -nargs=* MBEbun call <SID>DeleteBuffer(2,'<bang>'=='!',<f-args>)
endif

" }}}
"
" Global Configuration Variables - Depreciated
"
" {{{
if exists('g:miniBufExplSplitBelow')
  let g:miniBufExplBRSplit = g:miniBufExplSplitBelow
endif

if exists('g:miniBufExplMaxHeight')
  let g:miniBufExplMaxSize = g:miniBufExplMaxHeight
endif

if exists('g:miniBufExplMinHeight')
  let g:miniBufExplMinSize = g:miniBufExplMinHeight
endif

if exists('g:miniBufExplorerMoreThanOne')
  let g:miniBufExplBuffersNeeded = g:miniBufExplorerMoreThanOne
endif

if exists('g:miniBufExplorerAutoStart')
  let g:miniBufExplAutoStart = g:miniBufExplorerAutoStart
endif

if exists('g:miniBufExplorerDebugMode')
  let g:miniBufExplDebugMode = g:miniBufExplorerDebugMode
endif

if exists('g:miniBufExplorerDebugLevel')
  let g:miniBufExplDebugLevel = g:miniBufExplorerDebugLevel
endif

if exists('g:miniBufExplorerDebugOutput')
  let g:miniBufExplDebugOutput = g:miniBufExplorerDebugOutput
endif

if exists('g:miniBufExplorerHideWhenDiff')
  let g:miniBufExplHideWhenDiff = g:miniBufExplorerHideWhenDiff
endif

" }}}
"
" Global Configuration Variables
"
" Start MBE automatically ? {{{
"
if !exists('g:miniBufExplAutoStart')
  let g:miniBufExplAutoStart = 1
endif

" }}}
" Debug Mode {{{
"
" 0 = debug to a window
" 1 = use vim's echo facility
" 2 = write to a file named MiniBufExplorer.DBG
"     in the directory where vim was started
"     THIS IS VERY SLOW
" 3 = Write into g:miniBufExplDebugOutput
"     global variable [This is the default]
if !exists('g:miniBufExplDebugMode')
  let g:miniBufExplDebugMode = 3
endif

" }}}
" Debug Level {{{
"
" 0 = no logging
" 1=5 = errors ; 1 is the most important
" 5-9 = info ; 5 is the most important
" 10 = Entry/Exit
if !exists('g:miniBufExplDebugLevel')
  let g:miniBufExplDebugLevel = 1
endif

" }}}
" Stop auto starting MBE in diff mode? {{{
if !exists('g:miniBufExplHideWhenDiff')
    let g:miniBufExplHideWhenDiff = 0
endif

" }}}
" MoreThanOne? {{{
" Display Mini Buf Explorer when there are 'More Than One' eligible buffers
"
if !exists('g:miniBufExplBuffersNeeded')
  let g:miniBufExplBuffersNeeded = 2
endif

" }}}
" Set the updatetime? {{{
if !exists('g:miniBufExplSetUT')
    let g:miniBufExplSetUT = 1
endif

" }}}
" Horizontal or Vertical explorer? {{{
" For folks that like vertical explorers, I'm caving in and providing for
" veritcal splits. If this is set to 0 then the current horizontal
" splitting logic will be run. If however you want a vertical split,
" assign the width (in characters) you wish to assign to the MBE window.
"
if !exists('g:miniBufExplVSplit')
  let g:miniBufExplVSplit = 0
endif

" }}}
" Split below/above/left/right? {{{
" When opening a new -MiniBufExplorer- window, split the new windows below or
" above the current window?  1 = below, 0 = above.
"
if !exists('g:miniBufExplBRSplit')
  let g:miniBufExplBRSplit = g:miniBufExplVSplit ? &splitright : &splitbelow
endif

" }}}
" Split to edge? {{{
" When opening a new -MiniBufExplorer- window, split the new windows to the
" full edge? 1 = yes, 0 = no.
"
if !exists('g:miniBufExplSplitToEdge')
  let g:miniBufExplSplitToEdge = 1
endif

" }}}
" MaxSize {{{
" Same as MaxHeight but also works for vertical splits if specified with a
" vertical split then vertical resizing will be performed. If left at 0
" then the number of columns in g:miniBufExplVSplit will be used as a
" static window width.
if !exists('g:miniBufExplMaxSize')
  let g:miniBufExplMaxSize = 0
endif

" }}}
" MinSize {{{
" Same as MinHeight but also works for vertical splits. For vertical splits,
" this is ignored unless g:miniBufExplMax(Size|Height) are specified.
if !exists('g:miniBufExplMinSize')
  let g:miniBufExplMinSize = 1
endif

" }}}
" TabWrap? {{{
" By default line wrap is used (possibly breaking a tab name between two
" lines.) Turning this option on (setting it to 1) can take more screen
" space, but will make sure that each tab is on one and only one line.
"
if !exists('g:miniBufExplTabWrap')
  let g:miniBufExplTabWrap = 0
endif

" }}}
" ShowBufNumber? {{{
" By default buffers' numbers are shown in MiniBufExplorer. You can turn it off
" by setting this option to 0.
"
if !exists('g:miniBufExplShowBufNumbers')
  let g:miniBufExplShowBufNumbers = 1
endif

" }}}
" Single/Double Click? {{{
" flag that can be set to 1 in a users .vimrc to allow
" single click switching of tabs. By default we use
" double click for tab selection.
"
if !exists('g:miniBufExplUseSingleClick')
  let g:miniBufExplUseSingleClick = 0
endif

" }}}
" Close on Select? {{{
" Flag that can be set to 1 in a users .vimrc to hide
" the explorer when a user selects a buffer.
"
if !exists('g:miniBufExplCloseOnSelect')
  let g:miniBufExplCloseOnSelect = 0
endif

" }}}
" Status Line Text for MBE window {{{
"
if !exists('g:miniBufExplStatusLineText')
  let g:miniBufExplStatusLineText = "-MiniBufExplorer-"
endif

" }}}
" How to sort the buffers in MBE window {{{
"
if !exists('g:miniBufExplSortBy')
  let g:miniBufExplSortBy = "number"
endif

" }}}
" Should buffer be cycled arround if hits the begining or the end while {{{
" using MBE's buffer movement commands.
"
if !exists('g:miniBufExplCycleArround')
  let g:miniBufExplCycleArround = 0
endif

" }}}
"
" Variables used internally
"
" Script/Global variables {{{
" In debug mode 3 this variable will hold the debug output
let g:miniBufExplDebugOutput = ''

" check to see what platform we are in
if (has('unix'))
    let s:PathSeparator = '/'
else
    let s:PathSeparator = '\'
endif

" Variable used to count debug output lines
let s:debugIndex = 0

" Variable used to pass maxTabWidth info between functions
let s:maxTabWidth = 0

" Variable used as a mutex to indicate the current state of MBEToggleAll
let s:TabsMBEState = 0

" List for all eligible buffers
let s:BufList = []

" List for tracking order of the buffer entering
let s:MRUList = []

" Whether MRU List should be updated.
let s:MRUEnable = 1

" Dictionary used to keep track of the modification state of buffers
let s:bufStateDict = {}

" Global used to store the buffer list so that we don't update the MBE
" unless the list has changed.
let s:miniBufExplBufList = ''

" Variable used as a mutex so that AutoUpdates would not get nested.
let s:miniBufExplInAutoUpdate = 0

" Dictionary used to keep track of the names we have seen.
let s:bufNameDict = {}

" Dictionary used to map buffer numbers to names when the buffer
" names are not unique.
let s:bufUniqNameDict = {}

" Dictionary used to hold the path parts for each buffer
let s:bufPathDict = {}

" Dictionary used to hold the path signature index for each buffer
let s:bufPathSignDict = {}

" We start out with this off for startup, but once vim is running we
" turn this on. This prevent any BufEnter event from being triggered
" before VimEnter event.
let t:miniBufExplAutoUpdate = 0

" If MBE was opened manually, then we should skip eligible buffers checking,
" open MBE window no matter what value 'g:miniBufExplBuffersNeeded' is set.
let t:skipEligibleBuffersCheck = 0

" The order of buffer listing in MBE window is tab dependently.
let t:miniBufExplSortBy = g:miniBufExplSortBy

" }}}
"
" Auto Commands
"
" Setup an autocommand group and some autocommands {{{
" that keep our explorer updated automatically.
"

" Set a lower value to 'updatetime' for the CursorHold/CursorHoldI event, so
" that the MBE could be updated in time. It can not be set too low, otherwise
" might breaks many things, 1500ms should be a reasonable value.
" We only change it if we are allowed to and it has not been changed yet.
if g:miniBufExplSetUT && &ut == 4000
  set updatetime=1500
endif

augroup MiniBufExpl
  autocmd!
  autocmd VimEnter       * nested call <SID>VimEnterHandler()
  autocmd TabEnter       * nested call <SID>TabEnterHandler()
  autocmd BufAdd         *        call <SID>BufAddHandler()
  autocmd BufEnter       * nested call <SID>BufEnterHandler()
  autocmd BufDelete      *        call <SID>BufDeleteHandler()
  autocmd CursorHold,CursorHoldI,BufWritePost    *
    \ call <SID>DEBUG('Entering UpdateBufferStateDict AutoCmd', 10) |
    \ call <SID>UpdateBufferStateDict(bufnr("%"),0) |
    \ call <SID>DEBUG('Leaving UpdateBufferStateDict AutoCmd', 10)
if exists('##QuitPre')
  autocmd QuitPre        *
    \ if <SID>NextNormalWindow() == -1 | call <SID>StopExplorer(0) | endif
else
  autocmd BufEnter       * nested call <SID>QuitIfLastOpen()
endif
  autocmd FileType minibufexpl    call <SID>RenderSyntax()
augroup END

function! <SID>VimEnterHandler()
  call <SID>DEBUG('Entering VimEnter Handler', 10)

  " Build initial MRUList.
  " This makes sure all the files specified on the command
  " line are picked up correctly.
  let s:BufList = range(1, bufnr('$'))
  let s:MRUList = range(1, bufnr('$'))

  for l:i in s:BufList
    if <SID>IsBufferIgnored(l:i)
        call <SID>ListPop(s:BufList,l:i)
    endif
  endfor

  for l:i in s:MRUList
    if <SID>IsBufferIgnored(l:i)
        call <SID>ListPop(s:MRUList,l:i)
    endif
  endfor

  if g:miniBufExplHideWhenDiff!=1 || !&diff
    let t:miniBufExplAutoUpdate = 1
  endif

  if g:miniBufExplAutoStart && t:miniBufExplAutoUpdate == 1
        \ && (t:skipEligibleBuffersCheck == 1 || <SID>HasEligibleBuffers() == 1)
    call <SID>StartExplorer(bufnr("%"))

    " Let the MBE open in the new tab
    let s:TabsMBEState = 1
  endif

  call <SID>DEBUG('Leaving VimEnter Handler', 10)
endfunction

function! <SID>TabEnterHandler()
  call <SID>DEBUG('Entering TabEnter Handler', 10)

  if !exists('t:miniBufExplSortBy')
     let t:miniBufExplSortBy = g:miniBufExplSortBy
  endif

  if !exists('t:miniBufExplAutoUpdate')
    let t:miniBufExplAutoUpdate = s:TabsMBEState
  endif

  if !exists('t:skipEligibleBuffersCheck')
    let t:skipEligibleBuffersCheck = 0
  endif

  if g:miniBufExplAutoStart && t:miniBufExplAutoUpdate == 1
        \ && (t:skipEligibleBuffersCheck == 1 || <SID>HasEligibleBuffers() == 1)
    call <SID>StartExplorer(bufnr("%"))
  endif

  call <SID>DEBUG('Leaving TabEnter Handler', 10)
endfunction

function! <SID>BufAddHandler()
  call <SID>DEBUG('Entering BufAdd Handler', 10)

  call <SID>ListAdd(s:BufList,str2nr(expand("<abuf>")))
  call <SID>ListAdd(s:MRUList,str2nr(expand("<abuf>")))

  call <SID>UpdateAllBufferDicts(expand("<abuf>"),0)

  call <SID>AutoUpdate(bufnr("%"),0)

  call <SID>DEBUG('Leaving BufAdd Handler', 10)
endfunction

function! <SID>BufEnterHandler() abort
  call <SID>DEBUG('Entering BufEnter Handler', 10)

  for l:i in s:BufList
    if <SID>IsBufferIgnored(l:i)
        call <SID>ListPop(s:BufList,l:i)
    endif
  endfor

  for l:i in s:MRUList
    if <SID>IsBufferIgnored(l:i)
        call <SID>ListPop(s:MRUList,l:i)
    endif
  endfor

  call <SID>AutoUpdate(bufnr("%"),0)

  call <SID>DEBUG('Leaving BufEnter Handler', 10)
endfunction

function! <SID>BufDeleteHandler()
  call <SID>DEBUG('Entering BufDelete Handler', 10)

  call <SID>ListPop(s:BufList,str2nr(expand("<abuf>")))
  call <SID>ListPop(s:MRUList,str2nr(expand("<abuf>")))

  call <SID>UpdateAllBufferDicts(expand("<abuf>"),1)

  " Handle ':bd' command correctly
  if (bufname('%') == '-MiniBufExplorer-' && <SID>NextNormalWindow() == -1 && len(s:BufList) > 0)
    if(tabpagenr('$') == 1)
      setlocal modifiable
      resize
      exec 'noautocmd sb'.s:BufList[0]
      call <SID>StopExplorer(0)
      call <SID>StartExplorer(bufnr("%"))
    else
      close
    endif
  endif

  call <SID>AutoUpdate(bufnr("%"),1)

  call <SID>DEBUG('Leaving BufDelete Handler', 10)
endfunction
" }}}
"
" Functions
"
" RenderSyntax {{{
"
function! <SID>RenderSyntax()
  if has("syntax")
    syn clear
    syn match MBENormal                   '\[[^\]]*\]'
    syn match MBEChanged                  '\[[^\]]*\]+'
    syn match MBEVisibleNormal            '\[[^\]]*\]\*'
    syn match MBEVisibleChanged           '\[[^\]]*\]\*+'
    syn match MBEVisibleActiveNormal      '\[[^\]]*\]\*!'
    syn match MBEVisibleActiveChanged     '\[[^\]]*\]\*+!'

    "MiniBufExpl Color Examples
    " hi MBENormal               guifg=#808080 guibg=fg
    " hi MBEChanged              guifg=#CD5907 guibg=fg
    " hi MBEVisibleNormal        guifg=#5DC2D6 guibg=fg
    " hi MBEVisibleChanged       guifg=#F1266F guibg=fg
    " hi MBEVisibleActiveNormal  guifg=#A6DB29 guibg=fg
    " hi MBEVisibleActiveChanged guifg=#F1266F guibg=fg

    if !exists("g:did_minibufexplorer_syntax_inits")
      let g:did_minibufexplorer_syntax_inits = 1
      hi def link MBENormal                Comment
      hi def link MBEChanged               String
      hi def link MBEVisibleNormal         Special
      hi def link MBEVisibleChanged        Special
      hi def link MBEVisibleActiveNormal   Underlined
      hi def link MBEVisibleActiveChanged  Error
    endif

    let b:current_syntax = "minibufexpl"
  endif
endfunction

" }}}
" StartExplorer - Sets up our explorer and causes it to be displayed {{{
"
function! <SID>StartExplorer(curBufNum)
  call <SID>DEBUG('Entering StartExplorer('.a:curBufNum.')',10)

  call <SID>DEBUG('Current state: '.winnr().' : '.bufnr('%').' : '.bufname('%'),10)

  call <SID>BuildAllBufferDicts()

  let t:miniBufExplAutoUpdate = 1

  let l:winNum = <SID>FindWindow('-MiniBufExplorer-', 1)

  if l:winNum != -1
    call <SID>DEBUG('There is already a MBE window, aborting...',1)
    call <SID>DEBUG('Leaving StartExplorer()',10)
    return
  endif

  call <SID>CreateWindow('-MiniBufExplorer-', g:miniBufExplVSplit, g:miniBufExplBRSplit, g:miniBufExplSplitToEdge, 1, 1)

  let l:winNum = <SID>FindWindow('-MiniBufExplorer-', 1)

  if l:winNum == -1
    call <SID>DEBUG('Failed to create the MBE window, aborting...',1)
    call <SID>DEBUG('Leaving StartExplorer()',10)
    return
  endif

  " Save current window number and switch to previous
  " window before entering MBE window so that the later
  " `wincmd p` command will get into this window, then
  " we can preserve a one level window movement history.
  let l:currWin = winnr()
  call s:SwitchWindow('p',1)

  " Switch into MBE allowing autocmd to run will
  " make the syntax highlight in MBE window working
  call s:SwitchWindow('w',0,l:winNum)

  " Make sure we are in our window
  if bufname('%') != '-MiniBufExplorer-'
    call <SID>DEBUG('StartExplorer called in invalid window',1)
    call <SID>DEBUG('Leaving StartExplorer()',10)
    return
  endif

  " Set filetype for MBE buffer
  set filetype=minibufexpl

  " !!! We may want to make the following optional -- Bindu
  " New windows don't cause all windows to be resized to equal sizes
  set noequalalways

  " !!! We may want to make the following optional -- Bindu
  " We don't want the mouse to change focus without a click
  set nomousefocus

  if g:miniBufExplVSplit == 0
    setlocal wrap
  else
    setlocal nowrap
    exec 'setlocal winwidth='.g:miniBufExplMinSize
  endif

  " If folks turn numbering and columns on by default we will turn
  " them off for the MBE window
  setlocal foldcolumn=0
  setlocal nonumber
  if exists("&norelativenumber")
    " relativenumber was introduced in Vim 7.3 - this provides compatibility
    " for older versions of Vim
    setlocal norelativenumber
  endif
  "don't highlight matching parentheses, etc.
  setlocal matchpairs=
  "Depending on what type of split, make sure the MBE buffer is not
  "automatically rezised by CTRL + W =, etc...
  setlocal winfixheight
  setlocal winfixwidth

  " Set the text of the statusline for the MBE buffer. See help:stl for
  " many options
  exec 'setlocal statusline='.g:miniBufExplStatusLineText

  " No spell check
  setlocal nospell

  " Restore colorcolumn for VIM >= 7.3
  if exists("+colorcolumn")
      setlocal colorcolumn&
  end

  " If you press return, o or e in the -MiniBufExplorer- then try
  " to open the selected buffer in the previous window.
  nnoremap <buffer> o       :call <SID>MBESelectBuffer(0)<CR>:<BS>
  nnoremap <buffer> e       :call <SID>MBESelectBuffer(0)<CR>:<BS>
  nnoremap <buffer> <CR>    :call <SID>MBESelectBuffer(0)<CR>:<BS>
  " If you press s in the -MiniBufExplorer- then try
  " to open the selected buffer in a split in the previous window.
  nnoremap <buffer> s       :call <SID>MBESelectBuffer(1)<CR>:<BS>
  " If you press j in the -MiniBufExplorer- then try
  " to open the selected buffer in a vertical split in the previous window.
  nnoremap <buffer> v       :call <SID>MBESelectBuffer(2)<CR>:<BS>
  " If you press d in the -MiniBufExplorer- then try to
  " delete the selected buffer.
  nnoremap <buffer> d       :call <SID>MBEDeleteBuffer()<CR>:<BS>
  " The following allow us to use regular movement keys to
  " scroll in a wrapped single line buffer
  nnoremap <buffer> k       gk
  nnoremap <buffer> j       gj
  nnoremap <buffer> <up>    gk
  nnoremap <buffer> <down>  gj
  " The following allows for quicker moving between buffer
  " names in the [MBE] window it also saves the last-pattern
  " and restores it.
  if !g:miniBufExplShowBufNumbers
    nnoremap <buffer> l       :call search('\[[^\]]*\]')<CR>:<BS>
    nnoremap <buffer> h       :call search('\[[^\]]*\]','b')<CR>:<BS>
    nnoremap <buffer> <right> :call search('\[[^\]]*\]')<CR>:<BS>
    nnoremap <buffer> <left>  :call search('\[[^\]]*\]','b')<CR>:<BS>
  else
    nnoremap <buffer> l       :call search('\[[0-9]*:[^\]]*\]')<CR>:<BS>
    nnoremap <buffer> h       :call search('\[[0-9]*:[^\]]*\]','b')<CR>:<BS>
    nnoremap <buffer> <right> :call search('\[[0-9]*:[^\]]*\]')<CR>:<BS>
    nnoremap <buffer> <left>  :call search('\[[0-9]*:[^\]]*\]','b')<CR>:<BS>
  endif

  " Attempt to perform single click mapping
  " It would be much nicer if we could 'nnoremap <buffer> ...', however
  " vim does not fire the '<buffer> <leftmouse>' when you use the mouse
  " to enter a buffer.
  if g:miniBufExplUseSingleClick == 1
    let l:mapcmd = ':nnoremap <silent> <LEFTMOUSE> <LEFTMOUSE>'
    let l:clickcmd = ':if bufname("%") == "-MiniBufExplorer-" <bar> call <SID>MBESelectBuffer(0) <bar> endif <CR>'
    " no mapping for leftmouse
    if maparg('<LEFTMOUSE>', 'n') == ''
      exec l:mapcmd . l:clickcmd
    " we have a mapping
    else
      let  l:mapcmd = l:mapcmd . substitute(substitute(maparg('<LEFTMOUSE>', 'n'), '|', '<bar>', 'g'), '\c^<LEFTMOUSE>', '', '')
      let  l:mapcmd = l:mapcmd . l:clickcmd
      exec l:mapcmd
    endif
  " If you DoubleClick in the MBE window then try to open the selected
  " buffer in the previous window.
  else
    nnoremap <buffer> <2-LEFTMOUSE> :call <SID>MBESelectBuffer(0)<CR>:<BS>
  endif

  call <SID>BuildBufferList(a:curBufNum)

  call <SID>DisplayBuffers(a:curBufNum)

  " Switch away from MBE allowing autocmd to run which will
  " trigger PowerLine's BufLeave event handler
  call s:SwitchWindow('p',0)

  " Now we are in the previous window, let's enter
  " the window current window, this will preserve
  " one-level backwards window movement history.
  call s:SwitchWindow('w',1,l:currWin)

  call <SID>DEBUG('Leaving StartExplorer()',10)
endfunction

" }}}
" StopExplorer - Looks for our explorer and closes the window if it is open {{{
"
function! <SID>StopExplorer(force)
  call <SID>DEBUG('Entering StopExplorer()',10)

  if a:force || <SID>HasEligibleBuffers()
    let t:miniBufExplAutoUpdate = 0
  endif

  let l:winNum = <SID>FindWindow('-MiniBufExplorer-', 1)

  if l:winNum == -1
    call <SID>DEBUG('There is no MBE window, aborting...',1)
    call <SID>DEBUG('Leaving StopExplorer()',10)
    return
  endif

  call s:SwitchWindow('w',1,l:winNum)
  silent! close
  call s:SwitchWindow('p',1)

  " Work around a redraw bug in gVim (Confirmed present in 7.3.50)
  if has('gui_gtk') && has('gui_running')
      redraw!
  endif

  call <SID>DEBUG('Leaving StopExplorer()',10)
endfunction

" }}}
" FocusExplorer {{{
"
function! <SID>FocusExplorer()
  call <SID>DEBUG('Entering FocusExplorer()',10)

  let t:miniBufExplAutoUpdate = 1

  let l:winNum = <SID>FindWindow('-MiniBufExplorer-', 1)

  if l:winNum == -1
    call <SID>DEBUG('There is no MBE window, aborting...',1)
    call <SID>DEBUG('Leaving FocusExplorer()',10)
    return
  endif

  call s:SwitchWindow('w',0,l:winNum)

  call <SID>DEBUG('Leaving FocusExplorer()',10)
endfunction

" }}}
" ToggleMRU - Switch the order of buffer listing in MBE window {{{
" between its default and most recently used.
"
function! <SID>ToggleMRU()
  call <SID>DEBUG('Entering ToggleMRU()',10)

  if t:miniBufExplSortBy == 'number'
    let t:miniBufExplSortBy = 'mru'
  else
    let t:miniBufExplSortBy = 'number'
  endif

  let l:winnr = <SID>FindWindow('-MiniBufExplorer-', 1)

  if (l:winnr == -1)
    call <SID>DEBUG('MiniBufExplorer was not running, starting...', 9)
    call <SID>StartExplorer(bufnr('%'))
  else
    call <SID>DEBUG('Updating MiniBufExplorer...', 9)
    call <SID>UpdateExplorer(bufnr('%'))
  endif

  call <SID>DEBUG('Leaving ToggleMRU()',10)
endfunction

" }}}
" ToggleExplorer - Looks for our explorer and opens/closes the window {{{
"
" a:tabs, 0 no, 1 yes
"   toggle MBE in all tabs
" a:force, 0 no, 1 yes
"   reopen MBE when it is already open
"   close MBE with auto-updating disabled
"
function! <SID>ToggleExplorer(tabs,force)
  call <SID>DEBUG('Entering ToggleExplorer()',10)

  if a:tabs
    if s:TabsMBEState
      tabdo let t:skipEligibleBuffersCheck = 0 | call <SID>StopExplorer(a:force)
    else
      tabdo let t:skipEligibleBuffersCheck = 1 | if a:force | call <SID>StopExplorer(0) | endif | call <SID>StartExplorer(bufnr("%"))
    endif
    let s:TabsMBEState = !s:TabsMBEState
  else
    let l:winNum = <SID>FindWindow('-MiniBufExplorer-', 1)

    if l:winNum != -1
      let t:skipEligibleBuffersCheck = 0
      call <SID>StopExplorer(a:force)
    else
      let t:skipEligibleBuffersCheck = 1
      call <SID>StartExplorer(bufnr("%"))
    endif
  endif

  call <SID>DEBUG('Leaving ToggleExplorer()',10)
endfunction

" }}}
" UpdateExplorer {{{
"
function! <SID>UpdateExplorer(curBufNum)
  call <SID>DEBUG('Entering UpdateExplorer('.a:curBufNum.')',10)

  call <SID>DEBUG('Current state: '.winnr().' : '.bufnr('%').' : '.bufname('%'),10)

  if !<SID>BuildBufferList(a:curBufNum)
    call <SID>DEBUG('Buffer List have not changed, aborting...',10)
    call <SID>DEBUG('Leaving UpdateExplorer()',10)
    return
  endif

  let l:winNum = <SID>FindWindow('-MiniBufExplorer-', 1)

  if l:winNum == -1
    call <SID>DEBUG('Found no MBE window, aborting...',1)
    call <SID>DEBUG('Leaving UpdateExplorer()',10)
    return
  endif

  if l:winNum != winnr()
    let l:winChanged = 1

    " Save current window number and switch to previous
    " window before entering MBE window so that the later
    " `wincmd p` command will get into this window, then
    " we can preserve a one level window movement history.
    let l:currWin = winnr()
    call s:SwitchWindow('p',1)

    " Switch into MBE allowing autocmd to run will
    " make the syntax highlight in MBE window working
    call s:SwitchWindow('w',0,l:winNum)
  endif

  call <SID>DisplayBuffers(a:curBufNum)

  if exists('l:winChanged')
    " Switch away from MBE allowing autocmd to run which will
    " trigger PowerLine's BufLeave event handler
    call s:SwitchWindow('p',0)

    " Now we are in the previous window, let's enter
    " the window current window, this will preserve
    " one-level backwards window movement history.
    call s:SwitchWindow('w',1,l:currWin)
  endif

  call <SID>DEBUG('Leaving UpdateExplorer()',10)
endfunction

" }}}
" FindWindow - Return the window number of a named buffer {{{
" If none is found then returns -1.
"
function! <SID>FindWindow(bufName, doDebug)
  if a:doDebug
    call <SID>DEBUG('Entering FindWindow('.a:bufName.','.a:doDebug.')',10)
  endif

  " Try to find an existing window that contains
  " our buffer.
  let l:winnr = bufwinnr(a:bufName)

  if l:winnr != -1
    if a:doDebug
      call <SID>DEBUG('Found window '.l:winnr.' with buffer ('.winbufnr(l:winnr).' : '.bufname(winbufnr(l:winnr)).')',9)
    endif
  else
    if a:doDebug
      call <SID>DEBUG('Can not find window with buffer ('.a:bufName.')',9)
    endif
  endif

  if a:doDebug
    call <SID>DEBUG('Leaving FindWindow()',10)
  endif

  return l:winnr
endfunction

" }}}
" CreateWindow {{{
"
" vSplit, 0 no, 1 yes
"   split vertically or horizontally
" brSplit, 0 no, 1 yes
"   split the window below/right to current window
" forceEdge, 0 no, 1 yes
"   split the window at the edege of the editor
" isPluginWindow, 0 no, 1 yes
"   if it is a plugin window
" doDebug, 0 no, 1 yes
"   show debugging message or not
"
function! <SID>CreateWindow(bufName, vSplit, brSplit, forceEdge, isPluginWindow, doDebug)
  if a:doDebug
    call <SID>DEBUG('Entering CreateWindow('.a:bufName.','.a:vSplit.','.a:brSplit.','.a:forceEdge.','.a:isPluginWindow.','.a:doDebug.')',10)
  endif

  " Window number will change after creating a new window,
  " we need to save both current and previous window number
  " so that we can canculate theire correct window number
  " after the new window creating.
  let l:currWin = winnr()
  call s:SwitchWindow('p',1)
  let l:prevWin = winnr()
  call s:SwitchWindow('p',1)

  " Save the user's split setting.
  let l:saveSplitBelow = &splitbelow
  let l:saveSplitRight = &splitright

  " Set to our new values.
  let &splitbelow = a:brSplit
  let &splitright = a:brSplit

  let l:bufNum = bufnr(a:bufName)

  if l:bufNum == -1
    let l:spCmd = 'sp'
  else
    let l:spCmd = 'sb'
  endif

  if a:forceEdge == 1
    let l:edge = a:vSplit ? &splitright : &splitbelow

    if l:edge
      if a:vSplit == 0
        silent exec 'noautocmd bo '.l:spCmd.' '.a:bufName
      else
        silent exec 'noautocmd bo vert '.l:spCmd.' '.a:bufName
      endif
    else
      if a:vSplit == 0
        silent exec 'noautocmd to '.l:spCmd.' '.a:bufName
      else
        silent exec 'noautocmd to vert '.l:spCmd.' '.a:bufName
      endif
    endif
  else
    if a:vSplit == 0
      silent exec 'noautocmd '.l:spCmd.' '.a:bufName
    else
      silent exec 'noautocmd vert '.l:spCmd.' '.a:bufName
    endif
  endif

  " Restore the user's split setting.
  let &splitbelow = l:saveSplitBelow
  let &splitright = l:saveSplitRight

  " Turn off the swapfile, set the buftype and bufhidden option, so that it
  " won't get written and will be deleted when it gets hidden.
  if a:isPluginWindow
    setlocal noswapfile
    setlocal nobuflisted
    setlocal buftype=nofile
    setlocal bufhidden=delete
  endif

  " Canculate the correct window number, for those whose window
  " number before the creating is greater than or equal to the
  " number of the newly created window, their window number should
  " increase by one.
  let l:prevWin = l:prevWin >= winnr() ? l:prevWin + 1 : l:prevWin
  let l:currWin = l:currWin >= winnr() ? l:currWin + 1 : l:currWin
  " This will preserve one-level backwards window movement history.
  call s:SwitchWindow('w',1,l:prevWin)
  call s:SwitchWindow('w',1,l:currWin)

  if a:doDebug
    call <SID>DEBUG('Leaving CreateWindow()',10)
  endif
endfunction

" }}}
" FindCreateWindow - Attempts to find a window for a named buffer. {{{
"
" If it is found then moves there. Otherwise creates a new window and
" configures it and moves there.
"
" vSplit, 0 no, 1 yes
"   split vertically or horizontally
" brSplit, 0 no, 1 yes
"   split the window below/right to current window
" forceEdge, 0 no, 1 yes
"   split the window at the edege of the editor
" isPluginWindow, 0 no, 1 yes
"   if it is a plugin window
" doDebug, 0 no, 1 yes
"   show debugging message or not
"
function! <SID>FindCreateWindow(bufName, vSplit, brSplit, forceEdge, isPluginWindow, doDebug)
  if a:doDebug
    call <SID>DEBUG('Entering FindCreateWindow('.a:bufName.','.a:vSplit.','.a:brSplit.','.a:forceEdge.','.a:isPluginWindow.','.a:doDebug.')',10)
  endif

  " Try to find an existing explorer window
  let l:winNum = <SID>FindWindow(a:bufName, a:doDebug)

  " If found goto the existing window, otherwise
  " split open a new window.
  if l:winNum == -1
    if a:doDebug
      call <SID>DEBUG('Creating a new window with buffer ('.a:bufName.')',9)
    endif

    call <SID>CreateWindow(a:bufName, a:vSplit, a:brSplit, a:forceEdge, a:isPluginWindow, a:doDebug)

    " Try to find an existing explorer window
    let l:winNum = <SID>FindWindow(a:bufName, 0)

    if l:winNum != -1
      if a:doDebug
        call <SID>DEBUG('Created window '.l:winNum.' with buffer ('.a:bufName.')',9)
      endif
    else
      if a:doDebug
        call <SID>DEBUG('Failed to create window with buffer ('.a:bufName.').',1)
      endif
    endif
  endif

  if a:doDebug
    call <SID>DEBUG('Leaving FindCreateWindow()',10)
  endif

  return l:winNum
endfunction

" }}}
" DisplayBuffers - Wrapper for getting MBE window shown {{{
"
" Makes sure we are in our explorer, then erases the current buffer and turns
" it into a mini buffer explorer window.
"
function! <SID>DisplayBuffers(curBufNum)
  call <SID>DEBUG('Entering DisplayExplorer('.a:curBufNum.')',10)

  " Make sure we are in our window
  if bufname('%') != '-MiniBufExplorer-'
    call <SID>DEBUG('DisplayBuffers called in invalid window',1)
    return
  endif

  call <SID>ShowBuffers()
  call <SID>ResizeWindow()

  " Place cursor at current buffer in MBE
  if !<SID>IsBufferIgnored(a:curBufNum)
    if !g:miniBufExplShowBufNumbers
      call search('\V['.s:bufUniqNameDict[a:curBufNum].']', 'w')
    else
      call search('\V['.a:curBufNum.':'.s:bufUniqNameDict[a:curBufNum].']', 'w')
    endif
  endif

  call <SID>DEBUG('Leaving DisplayExplorer()',10)
endfunction

" }}}
" Resize Window - Set width/height of MBE window {{{
"
" Makes sure we are in our explorer, then sets the height/width for our explorer
" window so that we can fit all of our information without taking extra lines.
"
function! <SID>ResizeWindow()
  call <SID>DEBUG('Entering ResizeWindow()',10)

  " Make sure we are in our window
  if bufname('%') != '-MiniBufExplorer-'
    call <SID>DEBUG('ResizeWindow called in invalid window',1)
    call <SID>DEBUG('Leaving ResizeWindow()',10)
    return
  endif

  " Prevent a report of our actions from showing up.
  let l:save_rep = &report
  let l:save_sc  = &showcmd
  let &report    = 10000
  set noshowcmd

  let l:width  = winwidth('.')

  " Horizontal Resize
  if g:miniBufExplVSplit == 0

    if g:miniBufExplTabWrap == 0
      let l:length = strlen(getline('.'))
      let l:height = 0
      if (l:width == 0)
        let l:height = winheight('.')
      else
        let l:height = (l:length / l:width)
        " handle truncation from div
        if (l:length % l:width) != 0
          let l:height = l:height + 1
        endif
      endif
    else
      " We need to be able to modify the buffer
      setlocal modifiable

      exec "setlocal textwidth=".l:width
      normal gg
      normal gq}
      normal G
      let l:height = line('.')
      normal gg

      " Prevent the buffer from being modified.
      setlocal nomodifiable
    endif

    " enforce max window height
    if g:miniBufExplMaxSize != 0
      if g:miniBufExplMaxSize < l:height
        let l:height = g:miniBufExplMaxSize
      endif
    endif

    " enfore min window height
    if l:height < g:miniBufExplMinSize || l:height == 0
      let l:height = g:miniBufExplMinSize
    endif

    call <SID>DEBUG('ResizeWindow to '.l:height.' lines',9)

    if &winminheight > l:height
        let l:saved_winminheight = &winminheight
        let &winminheight = 1
        exec 'resize '.l:height
        let &winminheight = l:saved_winminheight
    else
        exec 'resize '.l:height
    endif

    let saved_ead = &ead
    let &ead = 'ver'
    set equalalways
    let &ead = saved_ead
    set noequalalways

  " Vertical Resize
  else

    if g:miniBufExplMaxSize != 0
      let l:newWidth = s:maxTabWidth
      if l:newWidth > g:miniBufExplMaxSize
          let l:newWidth = g:miniBufExplMaxSize
      endif
      if l:newWidth < g:miniBufExplMinSize
          let l:newWidth = g:miniBufExplMinSize
      endif
    else
      let l:newWidth = g:miniBufExplVSplit
    endif

    if l:width != l:newWidth
      call <SID>DEBUG('ResizeWindow to '.l:newWidth.' columns',9)
      exec 'vertical resize '.l:newWidth
    endif

    let saved_ead = &ead
    let &ead = 'hor'
    set equalalways
    let &ead = saved_ead
    set noequalalways

  endif

  normal! zz

  let &report  = l:save_rep
  let &showcmd = l:save_sc

  call <SID>DEBUG('Leaving ResizeWindow()',10)
endfunction

" }}}
" ShowBuffers - Clear current buffer and put the MBE text into it {{{
"
" Makes sure we are in our explorer, then adds a list of all modifiable
" buffers to the current buffer. Special marks are added for buffers that
" are in one or more windows (*) and buffers that have been modified (+)
"
function! <SID>ShowBuffers()
  call <SID>DEBUG('Entering ShowExplorer()',10)

  " Make sure we are in our window
  if bufname('%') != '-MiniBufExplorer-'
    call <SID>DEBUG('ShowBuffers called in invalid window',1)
    call <SID>DEBUG('Leaving ShowBuffers()',10)
    return
  endif

  let l:save_rep = &report
  let l:save_sc = &showcmd
  let &report = 10000
  set noshowcmd

  " We need to be able to modify the buffer
  setlocal modifiable

  " Delete all lines in buffer.
  silent 1,$d _

  " Goto the end of the buffer put the buffer list
  " and then delete the extra trailing blank line
  $
  put! =s:miniBufExplBufList
  silent $ d _

  " Prevent the buffer from being modified.
  setlocal nomodifiable

  let &report  = l:save_rep
  let &showcmd = l:save_sc

  call <SID>DEBUG('Leaving ShowBuffers()',10)
endfunction

" }}}
" CycleBuffer - Cycle Through Buffers {{{
"
" Move to next or previous buffer in the current window. If there
" are no more modifiable buffers then stay on the current buffer.
" can be called with no parameters in which case the buffers are
" cycled forward. Otherwise a single argument is accepted, if
" it's 0 then the buffers are cycled backwards, otherwise they
" are cycled forward.
"
function! <SID>CycleBuffer(forward,...)
  if <SID>IsBufferIgnored(bufnr('%')) == 1
    return
  endif

  let curBufNum = bufnr('%')

  if exists('a:1') && a:1 == 1
    call <SID>DEBUG('MRUList is '.string(s:MRUList),1)
    let curBufIndex = index(s:MRUList, l:curBufNum)
    call <SID>DEBUG('curBufIndex is '.l:curBufIndex,1)
    let forBufIndex = l:curBufIndex - 1 < 0 ? len(s:MRUList) - 1 : l:curBufIndex - 1
    call <SID>DEBUG('forBufIndex is '.l:forBufIndex,1)
    let bacBufIndex = l:curBufIndex + 1 >= len(s:MRUList) ? 0 : l:curBufIndex + 1
    call <SID>DEBUG('bacBufIndex is '.l:bacBufIndex,1)

    if a:forward
      if !g:miniBufExplCycleArround && l:curBufIndex < l:forBufIndex
        echo "You have reached the most recent buffer!"
        return
      endif
      let l:moveCmd = 'b! '.s:MRUList[l:forBufIndex]
    else
      if !g:miniBufExplCycleArround && l:curBufIndex > l:bacBufIndex
        echo "You have reached the least recent buffer!"
        return
      endif
      let l:moveCmd = 'b! '.s:MRUList[l:bacBufIndex]
    endif

    let s:MRUEnable = 0
  else
    call <SID>DEBUG('BufList is '.string(s:BufList),1)
    let curBufIndex = index(s:BufList, l:curBufNum)
    call <SID>DEBUG('curBufIndex is '.l:curBufIndex,1)
    let forBufIndex = l:curBufIndex + 1 >= len(s:BufList) ? 0 : l:curBufIndex + 1
    call <SID>DEBUG('forBufIndex is '.l:forBufIndex,1)
    let bacBufIndex = l:curBufIndex - 1 < 0 ? len(s:BufList) - 1 : l:curBufIndex - 1
    call <SID>DEBUG('bacBufIndex is '.l:bacBufIndex,1)

    if a:forward
      if !g:miniBufExplCycleArround && l:curBufIndex > l:forBufIndex
        echo "You have reached the last buffer!"
        return
      endif
      let l:moveCmd = 'b! '.s:BufList[l:forBufIndex]
    else
      if !g:miniBufExplCycleArround && l:curBufIndex < l:bacBufIndex
        echo "You have reached the first buffer!"
        return
      endif
      let l:moveCmd = 'b! '.s:BufList[l:bacBufIndex]
    endif

    let s:MRUEnable = 1
  endif

  call <SID>DEBUG('===============move cmd is '.l:moveCmd,1)

  " Change buffer (keeping track of before and after buffers)
  exec l:moveCmd

  let s:MRUEnable = 1
endfunction

" }}}
" DeleteBuffer {{{
"
" Delete/Unload/Wipeout a buffer but preserve the window it was in
"
" a:action 0 bd, 1 bw, 2 bun
"   delete/wipeout/unload a buffer
" a:bufNum
"   number of the buffer to be deleted
"
function! <SID>DeleteBuffer(action,bang,...)
  call <SID>DEBUG('Entering DeleteBuffer('.a:action.','.a:bang.')',10)

  if a:0 == 0
    call <SID>DEBUG('No buffer is given, use current buffer',5)
    let l:bufNums = [ bufnr('%') ]
  else
    call <SID>DEBUG('Given buffers are '.string(a:000),5)
    let l:bufNums = map(copy(a:000),'v:val =~ ''\d\+'' ? bufnr(v:val + 0) : bufnr(v:val)')
  endif

  call <SID>DEBUG('Buffers to be deleted are '.string(l:bufNums),5)

  for l:bufNum in l:bufNums
    if <SID>IsBufferIgnored(l:bufNum)
      call <SID>DEBUG('Buffer '.l:bufNum.'is not a normal buffer, skip it',5)
      continue
    endif

    let l:bufName = bufname(l:bufNum)
    call <SID>DEBUG('Buffer to be deleted is <'.l:bufName.'>['.l:bufNum.']',5)

    " Don't want auto updates while we are processing a delete
    " request.
    let l:saveAutoUpdate = t:miniBufExplAutoUpdate
    let t:miniBufExplAutoUpdate = 0

    " Get the currently active buffer, so we can update the MBE
    " correctly. If that is the buffer to be deleted, then get
    " the window for that buffer, so we can find which buffer
    " is in that window after the detaching.
    let l:actBuf = <SID>GetActiveBuffer()
    if l:actBuf == l:bufNum
      let l:actBufWin = bufwinnr(l:actBuf)
    endif

    " Detach the buffer from all the windows that holding it
    " in every tab page.
    tabdo call <SID>DetachBuffer(l:bufNum)

    " Find which buffer is in the active window now
    if l:actBuf == l:bufNum
      let l:actBuf = winbufnr(l:actBufWin)
    endif

    " Delete the buffer selected.
    call <SID>DEBUG('About to delete buffer: '.l:bufNum,5)

    if a:action == 2
      let l:cmd = 'bun'
    elseif a:action == 1
      let l:cmd = 'bw'
    else
      let l:cmd = 'bd'
    endif

    if a:bang
      let l:cmd = l:cmd.'!'
    endif

    let l:cmd = 'silent! '.l:cmd.' '.l:bufNum
    call <SID>DEBUG('About to execute the command "'.l:cmd.'"',5)

    exec l:cmd

    let t:miniBufExplAutoUpdate = l:saveAutoUpdate

    call <SID>UpdateExplorer(l:actBuf)
  endfor

  call <SID>DEBUG('Leaving DeleteBuffer()',10)
endfunction

" }}}
" DetachBuffer {{{
"
" Detach a buffer from all the windows in which it is displayed.
"
function! <SID>DetachBuffer(bufNum)
  call <SID>DEBUG('Entering DetachBuffer('.a:bufNum.')',10)

  call <SID>DEBUG('We are currently in tab page '.tabpagenr(),10)

  let l:bufNum = a:bufNum + 0

  let l:winNum = bufwinnr(l:bufNum)
  " while we have windows that contain our buffer
  while l:winNum != -1
    call <SID>DEBUG('Buffer '.l:bufNum.' is being displayed in window: '.l:winNum,5)

    " move to window that contains our selected buffer
    call s:SwitchWindow('w',1,l:winNum)

    call <SID>DEBUG('We are now in window: '.winnr(),5)

    call <SID>DEBUG('Window contains buffer: '.bufnr('%').' which should be: '.l:bufNum,5)
    let l:origBuf = bufnr('%')
    call <SID>CycleBuffer(0,1)
    let l:currBuf = bufnr('%')
    call <SID>DEBUG('Window now contains buffer: '.bufnr('%').' which should not be: '.l:bufNum,5)

    if l:origBuf == l:currBuf
      " we wrapped so we are going to have to delete a buffer
      " that is in an open window.
      let l:winNum = -1
    else
      " see if we have anymore windows with our selected buffer
      let l:winNum = bufwinnr(l:bufNum)
    endif
  endwhile

  call <SID>DEBUG('Leaving DetachBuffer()',10)
endfunction

" }}}
" IsBufferIgnored - check to see if buffer should be ignored {{{
"
" Returns 0 if this buffer should be displayed in the list, 1 otherwise.
"
function! <SID>IsBufferIgnored(buf)
  call <SID>DEBUG('Entering IsBufferIgnored('.a:buf.')',10)

  " Skip unlisted buffers.
  if buflisted(a:buf) == 0 || index(s:BufList,a:buf) == -1
    call <SID>DEBUG('Buffer '.a:buf.' is unlisted, ignoring...',5)
    call <SID>DEBUG('Leaving IsBufferIgnored()',10)
    return 1
  endif

  " Skip non normal buffers.
  if getbufvar(a:buf, "&buftype") != ''
    call <SID>DEBUG('Buffer '.a:buf.' is not normal, ignoring...',5)
    call <SID>DEBUG('Leaving IsBufferIgnored()',10)
    return 1
  endif

  call <SID>DEBUG('Leaving IsBufferIgnored()',10)
  return 0
endfunction

" }}}
" BuildBufferList - Build the text for the MBE window {{{
"
" Creates the buffer list string and returns 1 if it is different than
" last time this was called and 0 otherwise.
"
function! <SID>BuildBufferList(curBufNum)
    call <SID>DEBUG('Entering BuildBufferList('.a:curBufNum.')',10)

    let l:CurBufNum = a:curBufNum

    " Get the number of the last buffer.
    let l:NBuffers = bufnr('$')

    let l:tabList = []
    let l:maxTabWidth = 0

    " Loop through every buffer less than the total number of buffers.
    for l:i in s:BufList
        let l:BufName = expand( "#" . l:i . ":p:t")

        " Establish the tab's content, including the differentiating root
        " dir if neccessary
        let l:tab = '['
        if g:miniBufExplShowBufNumbers == 1
            let l:tab .= l:i.':'
        endif
        let l:tab .= s:bufUniqNameDict[l:i]
        let l:tab .= ']'

        " If the buffer is open in a window mark it
        if bufwinnr(l:i) != -1
            let l:tab .= '*'
        endif

        " If the buffer is modified then mark it
        if(getbufvar(l:i, '&modified') == 1)
            let l:tab .= '+'
        endif

        " If the buffer matches the)current buffer name, then  mark it
        call <SID>DEBUG('l:i is '.l:i.' and l:CurBufNum is '.l:CurBufNum,10)
        if(l:i == l:CurBufNum)
            let l:tab .= '!'
        endif

        let l:maxTabWidth = strlen(l:tab) > l:maxTabWidth ? strlen(l:tab) : l:maxTabWidth

        call add(l:tabList, l:tab)
    endfor

    if t:miniBufExplSortBy == "name"
        call sort(l:tabList, "<SID>NameCmp")
    elseif t:miniBufExplSortBy == "mru"
        call sort(l:tabList, "<SID>MRUCmp")
    endif

    let l:miniBufExplBufList = ''
    for l:tab in l:tabList
        let l:miniBufExplBufList = l:miniBufExplBufList.l:tab

        " If horizontal and tab wrap is turned on we need to add spaces
        if g:miniBufExplVSplit == 0
            if g:miniBufExplTabWrap != 0
                let l:miniBufExplBufList = l:miniBufExplBufList.' '
            endif
        " If not horizontal we need a newline
        else
            let l:miniBufExplBufList = l:miniBufExplBufList . "\n"
        endif
    endfor

    if (s:miniBufExplBufList != l:miniBufExplBufList)
        let s:maxTabWidth = l:maxTabWidth
        let s:miniBufExplBufList = l:miniBufExplBufList
        call <SID>DEBUG('Leaving BuildBufferList()',10)
        return 1
    else
        call <SID>DEBUG('Leaving BuildBufferList()',10)
        return 0
    endif
endfunction

" }}}
" CreateBufferUniqName {{{
"
" Construct a unique buffer name using the parts from the signature index of
" the path.
"
function! <SID>CreateBufferUniqName(bufNum)
    call <SID>DEBUG('Entering CreateBufferUniqName('.a:bufNum.')',10)

    let l:bufNum = 0 + a:bufNum
    let l:bufName = expand( "#" . l:bufNum . ":p:t")
    " Remove []'s & ()'s, these chars are preserved for buffer name locating
    let l:bufName = substitute(l:bufName, '[][()]', '', 'g')

    " Create a unique name for unamed buffer
    if empty(l:bufName)
        call <SID>DEBUG('Leaving CreateBufferUniqName()',10)
        return '--NO NAME--'.localtime()
    endif

    let l:bufPathPrefix = ""

    if(!has_key(s:bufPathSignDict, l:bufNum))
        call <SID>DEBUG(l:bufNum . ' is not in s:bufPathSignDict, aborting...',5)
        call <SID>DEBUG('Leaving CreateBufferUniqName()',10)
        return l:bufName
    endif

    let l:signs = s:bufPathSignDict[l:bufNum]
    if(empty(l:signs))
        call <SID>DEBUG('Signs for ' . l:bufNum . ' is empty, aborting...',5)
        call <SID>DEBUG('Leaving CreateBufferUniqName()',10)
        return l:bufName
    endif

    for l:sign in l:signs
        call <SID>DEBUG('l:sign is ' . l:sign,5)
        if empty(get(s:bufPathDict[l:bufNum],l:sign))
            continue
        endif
        let l:bufPathSignPart = get(s:bufPathDict[l:bufNum],l:sign).'/'
        " If the index is not right after the previous one and it is also not the
        " last one, then put a '-' before it
        if exists('l:last') && l:last + 1 != l:sign
            let l:bufPathSignPart = '-/'.l:bufPathSignPart
        endif
        let l:bufPathPrefix = l:bufPathPrefix.l:bufPathSignPart
        let l:last = l:sign
    endfor
    " If the last signature index is not the last index of the path, then put
    " a '-' after it
    if l:sign < len(s:bufPathDict[l:bufNum]) - 1
        let l:bufPathPrefix = l:bufPathPrefix.'-/'
    endif

    call <SID>DEBUG('Uniq name for ' . l:bufNum . ' is ' .  l:bufPathPrefix.l:bufName,5)

    call <SID>DEBUG('Leaving CreateBufferUniqName()',10)

    return l:bufPathPrefix.l:bufName
endfunction

" }}}
" UpdateBufferNameDict {{{
"
function! <SID>UpdateBufferNameDict(bufNum,deleted)
    call <SID>DEBUG('Entering UpdateBufferNameDict('.a:bufNum.','.a:deleted.')',10)

    let l:bufNum = 0 + a:bufNum

    let l:bufName = expand( "#" . l:bufNum . ":p:t")

    " Identify buffers with no name
    if empty(l:bufName)
        let l:bufName = '--NO NAME--'
    endif

    " Remove a deleted buffer from the buffer name dictionary
    if a:deleted
        if has_key(s:bufNameDict, l:bufName)
            call <SID>DEBUG('Found entry for deleted buffer '.l:bufNum,5)
            let l:bufnrs = s:bufNameDict[l:bufName]
            call filter(l:bufnrs, 'v:val != '.l:bufNum)
            let s:bufNameDict[l:bufName] = l:bufnrs
            call <SID>DEBUG('Delete entry for deleted buffer '.l:bufNum,5)
        endif
        call <SID>DEBUG('Leaving UpdateBufferNameDict()',10)
        return
    endif

    if(!has_key(s:bufNameDict, l:bufName))
        call <SID>DEBUG('Adding empty list for ' . l:bufName,5)
        let s:bufNameDict[l:bufName] = []
    endif

    if index(s:bufNameDict[l:bufName],l:bufNum) == -1
        call add(s:bufNameDict[l:bufName], l:bufNum)
    endif

    call <SID>DEBUG('Leaving UpdateBufferNameDict()',10)
endfunction

" }}}
" UpdateBufferPathDict {{{
"
function! <SID>UpdateBufferPathDict(bufNum,deleted)
    call <SID>DEBUG('Entering UpdateBufferPathDict('.a:bufNum.','.a:deleted.')',10)

    let l:bufNum = 0 + a:bufNum
    let l:bufPath = expand( "#" . l:bufNum . ":p:h")
    let l:bufName = expand( "#" . l:bufNum . ":p:t")

    " Identify buffers with no name
    if empty(l:bufName)
        let l:bufName = '--NO NAME--'
    endif

    " Remove a deleted buffer from the buffer path dictionary
    if a:deleted
        if has_key(s:bufNameDict, l:bufName)
            call <SID>DEBUG('Found entry for deleted buffer '.l:bufNum,5)
            let l:bufnrs = s:bufNameDict[l:bufName]
            call filter(s:bufPathDict, 'v:key != '.l:bufNum)
            call <SID>DEBUG('Delete entry for deleted buffer '.l:bufNum,5)
        endif
        call <SID>DEBUG('Leaving UpdateBufferPathDict()',10)
        return
    endif

    let s:bufPathDict[l:bufNum] = split(l:bufPath,s:PathSeparator,0)

    call <SID>DEBUG('Leaving UpdateBufferPathDict()',10)
endfunction

" }}}
" BuildBufferPathSignDict {{{
"
" Compare the parts from the same index of all the buffer's paths, if there
" are differences, it means this index is a signature index for all the
" buffer's paths, mark it. At this point, the buffers are splited into several
" subsets. Then, doing the same check for each subset on the next index. We
" should finally get a set of signature locations which will uniquely identify
" the path. We could then construct a string with these locaitons using as
" less characters as possible.
"
function! <SID>BuildBufferPathSignDict(bufnrs, ...)
    if a:0 == 0
        let index = 0
    else
        let index = a:1
    endif

    call <SID>DEBUG('Entering BuildBufferPathSignDict('.string(a:bufnrs).','.index.')',10)

    let bufnrs = a:bufnrs

    " Temporary dictionary to see if there is any different part
    let partDict = {}

    " Marker to see if there are more avaliable parts
    let moreParts = 0

    " Group the buffers by this part of the buffer's path
    for bufnr in bufnrs
        " Make sure each buffer has an entry in 's:bufPathSignDict'
        " If index is zero, we force re-initialize the entry
        if index == 0 || !has_key(s:bufPathSignDict, bufnr)
            let s:bufPathSignDict[bufnr] = []
        endif

        " If some buffers' path does not have this index, we skip it
        if len(s:bufPathDict[bufnr]) < index
            continue
        endif

        " Mark that there are still available paths
        let moreParts = 1

        " Get requested part of the path
        let part = get(s:bufPathDict[bufnr],index)

        if empty(part)
            let part = '--EMPTY--'
        endif

        " Group the buffers using dictionary by this part
        if(!has_key(partDict, part))
            let partDict[part] = []
        endif
        call add(partDict[part],bufnr)
    endfor

    " All the paths have been walked to the end
    if !moreParts
        call <SID>DEBUG('Leaving BuildBufferPathSignDict() '.index,10)
        return
    endif

    " We only need the buffer subsets from now on
    let subsets = values(partDict)

    " If the buffers have been splited into more than one subset, or all the
    " remaining buffers are still in the same subset but some buffers' path
    " have hit the end, then mark this index as signature index.
    if len(partDict) > 1 || ( len(partDict) == 1 && len(subsets[0]) < len(bufnrs) )
        " Store the signature index in the 's:bufPathSignDict' variable
        for bufnr in bufnrs
            call add(s:bufPathSignDict[bufnr],index)
        endfor
        " For all buffer subsets, increase the index by one, run again.
        for subset in subsets
            " If we only have one buffer left in the subset, it means there are
            " already enough signature index sufficient to identify the buffer
            if len(subset) <= 1
                continue
            endif
            call <SID>BuildBufferPathSignDict(subset, index + 1)
        endfor
    " If all the buffers are in the same subset, then this index is not a
    " signature index, increase the index by one, run again.
    else
        call <SID>BuildBufferPathSignDict(bufnrs, index + 1)
    endif

    call <SID>DEBUG('Leaving BuildBufferPathSignDict() '.index,10)
endfunction

" }}}
" UpdateBufferPathSignDict {{{
"
function! <SID>UpdateBufferPathSignDict(bufNum,deleted)
    call <SID>DEBUG('Entering UpdateBufferPathSignDict('.a:bufNum.','.a:deleted.')',10)

    let l:bufNum = 0 + a:bufNum

    " Remove a deleted buffer from the buffer path signature dictionary
    if a:deleted
        if has_key(s:bufPathSignDict, l:bufNum)
            call <SID>DEBUG('Found entry for deleted buffer '.l:bufNum,5)
            call filter(s:bufPathSignDict, 'v:key != '.l:bufNum)
            call <SID>DEBUG('Delete entry for deleted buffer '.l:bufNum,5)
        endif
        call <SID>DEBUG('Leaving UpdateBufferPathSignDict()',10)
        return
    endif

    call <SID>DEBUG('Leaving UpdateBufferPathSignDict()',10)
endfunction

" }}}
" BuildBufferFinalDict {{{
"
function! <SID>BuildBufferFinalDict(arg,deleted)
    call <SID>DEBUG('Entering BuildBufferFinalDict('.string(a:arg).','.a:deleted.')',10)

    if type(a:arg) == 3
        let l:bufnrs = a:arg
    else
        let l:bufNum = 0 + a:arg
        let l:bufName = expand( "#" . l:bufNum . ":p:t")

        " Identify buffers with no name
        if empty(l:bufName)
            let l:bufName = '--NO NAME--'
        endif

        if(!has_key(s:bufNameDict, l:bufName))
            call <SID>DEBUG(l:bufName . ' is not in s:bufNameDict, aborting...',5)
            call <SID>DEBUG('Leaving BuildBufferFinalDict()',10)
            return
        endif

        let l:bufnrs = s:bufNameDict[l:bufName]

        " Remove a deleted buffer from the buffer unique name dictionary
        if a:deleted
            call <SID>UpdateBufferPathSignDict(l:bufNum, a:deleted)
            call <SID>UpdateBufferUniqNameDict(l:bufNum, a:deleted)
        endif
    endif

    call <SID>BuildBufferPathSignDict(l:bufnrs)

    call <SID>BuildBufferUniqNameDict(l:bufnrs)

    call <SID>DEBUG('Leaving BuildBufferFinalDict()',10)
endfunction

" }}}
" BuildBufferUniqNameDict {{{
"
function! <SID>BuildBufferUniqNameDict(bufnrs)
    call <SID>DEBUG('Entering BuildBufferUniqNameDict('.string(a:bufnrs).')',10)

    let l:bufnrs = a:bufnrs

    for bufnr in l:bufnrs
        call <SID>UpdateBufferUniqNameDict(bufnr,0)
    endfor

    call <SID>DEBUG('Leaving BuildBufferUniqNameDict()',10)
endfunction

" }}}
" UpdateBufferUniqNameDict {{{
"
function! <SID>UpdateBufferUniqNameDict(bufNum,deleted)
    call <SID>DEBUG('Entering UpdateBufferUniqNameDict('.a:bufNum.','.a:deleted.')',10)

    let l:bufNum = 0 + a:bufNum

    " Remove a deleted buffer from the buffer path dictionary
    if a:deleted
        if has_key(s:bufUniqNameDict, l:bufNum)
            call <SID>DEBUG('Found entry for deleted buffer '.l:bufNum,5)
            call filter(s:bufUniqNameDict, 'v:key != '.l:bufNum)
            call <SID>DEBUG('Delete entry for deleted buffer '.l:bufNum,5)
        endif
        call <SID>DEBUG('Leaving UpdateBufferUniqNameDict()',10)
        return
    endif

    call <SID>DEBUG('Creating buffer name for ' . l:bufNum,5)
    let l:bufUniqName = <SID>CreateBufferUniqName(l:bufNum)

    call <SID>DEBUG('Setting ' . l:bufNum . ' to ' . l:bufUniqName,5)
    let s:bufUniqNameDict[l:bufNum] = l:bufUniqName

    call <SID>DEBUG('Leaving UpdateBufferUniqNameDict()',10)
endfunction

" }}}
" BuildAllBufferDicts {{{
"
function! <SID>BuildAllBufferDicts()
    call <SID>DEBUG('Entering BuildAllBuffersDicts()',10)

    " Get the number of the last buffer.
    let l:NBuffers = bufnr('$')

    " Loop through every buffer less than the total number of buffers.
    let l:i = 0
    while(l:i <= l:NBuffers)
        if <SID>IsBufferIgnored(l:i)
            let l:i = l:i + 1
            continue
        endif

        call <SID>UpdateBufferNameDict(l:i,0)
        call <SID>UpdateBufferPathDict(l:i,0)
        call <SID>UpdateBufferStateDict(l:i,0)

        let l:i = l:i + 1
    endwhile

    for bufnrs in values(s:bufNameDict)
        call <SID>BuildBufferFinalDict(bufnrs,0)
    endfor

    call <SID>DEBUG('Leaving BuildAllBuffersDicts()',10)
endfunction

" }}}
" UpdateAllBufferDicts {{{
"
function! <SID>UpdateAllBufferDicts(bufNum,deleted)
    call <SID>DEBUG('Entering UpdateAllBuffersDicts('.a:bufNum.','.a:deleted.')',10)

    call <SID>UpdateBufferNameDict(a:bufNum,a:deleted)
    call <SID>UpdateBufferPathDict(a:bufNum,a:deleted)
    call <SID>UpdateBufferStateDict(a:bufNum,a:deleted)

    call <SID>BuildBufferFinalDict(a:bufNum,a:deleted)

    call <SID>DEBUG('Leaving UpdateAllBuffersDicts()',10)
endfunction

" }}}
" UpdateBufferStateDict {{{
function! <SID>UpdateBufferStateDict(bufNum,deleted)
    call <SID>DEBUG('Entering UpdateBufferStateDict('.a:bufNum.','.a:deleted.')',10)

    let l:bufNum = 0 + a:bufNum

    if a:deleted && has_key(s:bufStateDict, l:bufNum)
        call filter(s:bufStateDict, 'v:key != '.l:bufNum)
        call <SID>DEBUG('Leaving UpdateBufferStateDict()',10)
        return
    endif

    if has_key(s:bufStateDict, l:bufNum)
        if s:bufStateDict[l:bufNum] != getbufvar(a:bufNum, '&modified')
            let s:bufStateDict[l:bufNum] = getbufvar(a:bufNum, '&modified')
            call <SID>AutoUpdate(bufnr(a:bufNum),0)
        endif
    else
        let s:bufStateDict[l:bufNum] = getbufvar(a:bufNum, '&modified')
    endif

    call <SID>DEBUG('Leaving UpdateBufferStateDict()',10)
endfunction

" }}}
" NameCmp - compares tabs based on filename {{{
"
function! <SID>NameCmp(tab1, tab2)
  let l:name1 = matchstr(a:tab1, ":.*")
  let l:name2 = matchstr(a:tab2, ":.*")
  if l:name1 < l:name2
    return -1
  elseif l:name1 > l:name2
    return 1
  else
    return 0
  endif
endfunction

" }}}
" MRUCmp - compares tabs based on MRU order {{{
"
function! <SID>MRUCmp(tab1, tab2)
  let l:buf1 = str2nr(matchstr(a:tab1, '[0-9]\+'))
  let l:buf2 = str2nr(matchstr(a:tab2, '[0-9]\+'))
  return index(s:MRUList, l:buf1) - index(s:MRUList, l:buf2)
endfunction

" }}}
" HasEligibleBuffers - Are there enough MBE eligible buffers to open the MBE window? {{{
"
" Returns 1 if there are any buffers that can be displayed in a
" mini buffer explorer. Otherwise returns 0.
"
function! <SID>HasEligibleBuffers()
  call <SID>DEBUG('Entering HasEligibleBuffers()',10)

  let l:found = len(s:BufList)
  let l:needed = g:miniBufExplBuffersNeeded

  call <SID>DEBUG('Eligible buffers are '.string(s:BufList),6)
  call <SID>DEBUG('Found '.l:found.' eligible buffers of '.l:needed.' needed',6)

  call <SID>DEBUG('Leaving HasEligibleBuffers()',10)
  return (l:found >= l:needed)
endfunction

" }}}
" Auto Update - Function called by auto commands for auto updating the MBE {{{
"
" IF auto update is turned on        AND
"    we are in a real buffer         AND
"    we have enough eligible buffers THEN
" Update our explorer and get back to the current window
"
" If we get a buffer number for a buffer that
" is being deleted, we need to make sure and
" remove the buffer from the list of eligible
" buffers in case we are down to one eligible
" buffer, in which case we will want to close
" the MBE window.
"
function! <SID>AutoUpdate(curBufNum,force)
  call <SID>DEBUG('Entering AutoUpdate('.a:curBufNum.')',10)

  call <SID>DEBUG('Current state: '.winnr().' : '.bufnr('%').' : '.bufname('%'),10)

  if (s:miniBufExplInAutoUpdate == 1)
    call <SID>DEBUG('AutoUpdate recursion stopped',9)
    call <SID>DEBUG('Leaving AutoUpdate()',10)
    return
  else
    let s:miniBufExplInAutoUpdate = 1
  endif

  " Skip windows holding ignored buffer
  if !a:force && <SID>IsBufferIgnored(a:curBufNum) == 1
    call <SID>DEBUG('Leaving AutoUpdate()',10)

    let s:miniBufExplInAutoUpdate = 0
    return
  endif

  if s:MRUEnable == 1
    call <SID>ListPush(s:MRUList,a:curBufNum)
  endif

  " Only allow updates when the AutoUpdate flag is set
  " this allows us to stop updates on startup.
  if exists('t:miniBufExplAutoUpdate') && t:miniBufExplAutoUpdate == 1
    " if we don't have a window then create one
    let l:winnr = <SID>FindWindow('-MiniBufExplorer-', 1)

    if (exists('t:skipEligibleBuffersCheck') && t:skipEligibleBuffersCheck == 1) || <SID>HasEligibleBuffers() == 1
      if (l:winnr == -1)
        if g:miniBufExplAutoStart == 1
          call <SID>DEBUG('MiniBufExplorer was not running, starting...', 9)
          call <SID>StartExplorer(a:curBufNum)
        else
          call <SID>DEBUG('MiniBufExplorer was not running, aborting...', 9)
          call <SID>DEBUG('Leaving AutoUpdate()',10)
          let s:miniBufExplInAutoUpdate = 0
          return
        endif
      else
        call <SID>DEBUG('Updating MiniBufExplorer...', 9)
        call <SID>UpdateExplorer(a:curBufNum)
      endif
    else
      if (l:winnr == -1)
        call <SID>DEBUG('MiniBufExplorer was not running, aborting...', 9)
        call <SID>DEBUG('Leaving AutoUpdate()',10)
        let s:miniBufExplInAutoUpdate = 0
        return
      else
        call <SID>DEBUG('Failed in eligible check', 9)
        call <SID>StopExplorer(0)
        " we do not want to turn auto-updating off
        let t:miniBufExplAutoUpdate = 1
      endif
    endif
  else
    call <SID>DEBUG('AutoUpdates are turned off, terminating',9)
  endif

  call <SID>DEBUG('Leaving AutoUpdate()',10)

  let s:miniBufExplInAutoUpdate = 0
endfunction

" }}}
" QuitIfLastOpen {{{
"
function! <SID>QuitIfLastOpen() abort
  " Quit MBE if no more mormal window left
  if (bufname('%') == '-MiniBufExplorer-') && (<SID>NextNormalWindow() == -1)
    call <SID>DEBUG('MBE is the last open window, quit it', 9)
    if tabpagenr('$') == 1
      " Before quitting Vim, delete the MBE buffer so that
      " the '0 mark is correctly set to the previous buffer.
      " Also disable autocmd on this command to avoid unnecessary
      " autocmd nesting.
      if winnr('$') == 1
        noautocmd bdelete
      endif
      quit
    else
      close
    endif
  endif
endfunction

" }}}
" GetActiveBuffer {{{
"
function! <SID>GetActiveBuffer()
  call <SID>DEBUG('Entering GetActiveBuffer()',10)
  let l:bufNum = substitute(s:miniBufExplBufList,'\[\([0-9]*\):[^\]]*\][^\!]*!', '\1', '') + 0
  call <SID>DEBUG('Currently active buffer is '.l:bufNum,10)
  call <SID>DEBUG('Leaving GetActiveBuffer()',10)
  return l:bufNum
endfunction

" }}}
" GetSelectedBuffer - From the MBE window, return the bufnum for buf under cursor {{{
"
" If we are in our explorer window then return the buffer number
" for the buffer under the cursor.
"
function! <SID>GetSelectedBuffer()
  call <SID>DEBUG('Entering GetSelectedBuffer()',10)

  " Make sure we are in our window
  if bufname('%') != '-MiniBufExplorer-'
    call <SID>DEBUG('GetSelectedBuffer called in invalid window',1)
    call <SID>DEBUG('Leaving GetSelectedBuffer()',10)
    return -1
  endif

  let l:save_rep = &report
  let l:save_sc  = &showcmd
  let &report    = 10000
  set noshowcmd

  let l:save_reg = @"
  let @" = ""
  normal ""yi[
  if @" != ""
    if !g:miniBufExplShowBufNumbers
      " This is a bit ugly, but it works, unless we come up with a
      " better way to get the key for a dictionary by its value.
      let l:bufUniqNameDictKeys = keys(s:bufUniqNameDict)
      let l:bufUniqNameDictValues = values(s:bufUniqNameDict)
      let l:retv = l:bufUniqNameDictKeys[match(l:bufUniqNameDictValues,substitute(@",'[0-9]*:\(.*\)', '\1', ''))]
    else
      let l:retv = substitute(@",'\([0-9]*\):.*', '\1', '') + 0
    endif
    let @" = l:save_reg
    call <SID>DEBUG('Leaving GetSelectedBuffer()',10)
    return l:retv
  else
    let @" = l:save_reg
    call <SID>DEBUG('Leaving GetSelectedBuffer()',10)
    return -1
  endif

  let &report  = l:save_rep
  let &showcmd = l:save_sc
endfunction

" }}}
" MBESelectBuffer - From the MBE window, open buffer under the cursor {{{
"
" If we are in our explorer, then we attempt to open the buffer under the
" cursor in the previous window.
"
" Split indicates whether to open with split, 0 no split, 1 split horizontally
"
function! <SID>MBESelectBuffer(split)
  call <SID>DEBUG('Entering MBESelectBuffer()',10)

  " Make sure we are in our window
  if bufname('%') != '-MiniBufExplorer-'
    call <SID>DEBUG('MBESelectBuffer called in invalid window',1)
    call <SID>DEBUG('Leaving MBESelectBuffer()',10)
    return
  endif

  let l:bufnr  = <SID>GetSelectedBuffer()

  if(l:bufnr != -1)             " If the buffer exists.
    let l:saveAutoUpdate = t:miniBufExplAutoUpdate
    let t:miniBufExplAutoUpdate = 0

    call s:SwitchWindow('p',1)

    if <SID>IsBufferIgnored(bufnr('%'))
      let l:winNum = <SID>NextNormalWindow()
      if l:winNum != -1
        call s:SwitchWindow('w',1,l:winNum)
      else
        call <SID>DEBUG('No elegible window avaliable',1)
        call <SID>DEBUG('Leaving MBESelectBuffer()',10)
        return
      endif
    endif

    if a:split == 0
	    exec 'b! '.l:bufnr
    elseif a:split == 1
	    exec 'sb! '.l:bufnr
    elseif a:split == 2
	    exec 'vertical sb! '.l:bufnr
    endif

    let t:miniBufExplAutoUpdate = l:saveAutoUpdate

    call <SID>AutoUpdate(bufnr("%"),0)
  endif

  if g:miniBufExplCloseOnSelect == 1
    call <SID>StopExplorer(0)
  endif

  call <SID>DEBUG('Leaving MBESelectBuffer()',10)
endfunction

" }}}
" MBEDeleteBuffer - From the MBE window, delete selected buffer from list {{{
"
" After making sure that we are in our explorer, This will delete the buffer
" under the cursor. If the buffer under the cursor is being displayed in a
" window, this routine will attempt to get different buffers into the
" windows that will be affected so that windows don't get removed.
"
function! <SID>MBEDeleteBuffer()
  call <SID>DEBUG('Entering MBEDeleteBuffer()',10)

  " Make sure we are in our window
  if bufname('%') != '-MiniBufExplorer-'
    call <SID>DEBUG('MBEDeleteBuffer called in invalid window',1)
    call <SID>DEBUG('Leaving MBEDeleteBuffer()',10)
    return
  endif

  let l:selBuf = <SID>GetSelectedBuffer()

  if l:selBuf != -1
    call <SID>DeleteBuffer(0,0,l:selBuf)
  endif

  call <SID>DEBUG('Leaving MBEDeleteBuffer()',10)
endfunction

" }}}
" NextNormalWindow {{{
"
function! <SID>NextNormalWindow()
  call <SID>DEBUG('Entering NextNormalWindow()',10)

  let l:winSum = winnr('$')
  call <SID>DEBUG('Total number of open windows are '.l:winSum,9)

  let l:i = 1
  while(l:i <= l:winSum)
    call <SID>DEBUG('window: '.l:i.', buffer: ('.winbufnr(l:i).':'.bufname(winbufnr(l:i)).')',9)
    if !<SID>IsBufferIgnored(winbufnr(l:i)) && l:i != winnr()
        call <SID>DEBUG('Found window '.l:i,8)
        call <SID>DEBUG('Leaving NextNormalWindow()',10)
        return l:i
    endif
    let l:i = l:i + 1
  endwhile

  call <SID>DEBUG('Found no window',8)
  call <SID>DEBUG('Leaving NextNormalWindow()',10)
  return -1
endfunction

" }}}
" ListAdd {{{
"
function! <SID>ListAdd(list,val)
  call <SID>DEBUG('Entering ListAdd('.string(a:list).','.a:val.')',10)
  call add(a:list, a:val)
  call <SID>DEBUG('Leaving ListAdd()',10)
endfunction

" }}}
" ListPop {{{
"
function! <SID>ListPop(list,val)
  call <SID>DEBUG('Entering ListPop('.string(a:list).','.a:val.')',10)
  call filter(a:list, 'v:val != '.a:val)
  call <SID>DEBUG('Leaving ListPop()',10)
endfunction

" }}}
" ListPush {{{
"
function! <SID>ListPush(list,val)
  call <SID>DEBUG('Entering ListPush('.string(a:list).','.a:val.')',10)
  " Remove the buffer number from the list if it already exists.
  call <SID>ListPop(a:list,a:val)

  " Add the buffer number to the head of the list.
  call insert(a:list,a:val)
  call <SID>DEBUG('Leaving ListPush()',10)
endfunction

" }}}
" DEBUG - Display debug output when debugging is turned on {{{
"
" Thanks to Charles E. Campbell, Jr. PhD <cec@NgrOyphSon.gPsfAc.nMasa.gov>
" for Decho.vim which was the inspiration for this enhanced debugging
" capability.
"
let g:miniBufExplFuncCallDepth = 0
function! <SID>DEBUG(msg, level)
  if g:miniBufExplDebugLevel >= a:level

    if a:level == 10 && a:msg =~ '^Entering'
      let g:miniBufExplFuncCallDepth += 1
    endif

    if a:msg =~ '^Entering'
      let l:msg = repeat('│ ',g:miniBufExplFuncCallDepth - 1).'┌ '.a:msg
    elseif a:msg =~ '^Leaving'
      let l:msg = repeat('│ ',g:miniBufExplFuncCallDepth - 1).'└ '.a:msg
    else
      let l:msg = repeat('│ ',g:miniBufExplFuncCallDepth).a:msg
    endif

    " Prevent a report of our actions from showing up.
    let l:save_rep    = &report
    let l:save_sc     = &showcmd
    let &report       = 10000
    set noshowcmd

    " Debug output to a buffer
    if g:miniBufExplDebugMode == 0
        if bufname('%') == 'MiniBufExplorer.DBG'
            return
        endif

        " Get into the debug window or create it if needed
        let l:winNum = <SID>FindCreateWindow('MiniBufExplorer.DBG', 0, 1, 1, 1, 0)

        if l:winNum == -1
          let g:miniBufExplDebugMode == 3
          call <SID>DEBUG('Failed to get the MBE debugging window, reset debugging mode to 3.',1)
          call <SID>DEBUG('Forwarding message...',1)
          call <SID>DEBUG(a:msg,1)
          call <SID>DEBUG('Forwarding message end.',1)
          return
        endif

        " Save the current window number so we can come back here
        let l:currWin = winnr()
        call s:SwitchWindow('p',1)

        " Change to debug window
        call s:SwitchWindow('w',1,l:winNum)

        " Make sure we really got to our window, if not we
        " will display a confirm dialog and turn debugging
        " off so that we won't break things even more.
        if bufname('%') != 'MiniBufExplorer.DBG'
            call confirm('Error in window debugging code. Dissabling MiniBufExplorer debugging.', 'OK')
            let g:miniBufExplDebugLevel = 0
            return
        endif

        set modified

        " Write Message to DBG buffer
        let res=append("$",s:debugIndex.':'.a:level.':'.a:msg)

        set nomodified

        norm G

        " Return to original window
        call s:SwitchWindow('p',1)
        call s:SwitchWindow('w',1,l:currWin)
    " Debug output using VIM's echo facility
    elseif g:miniBufExplDebugMode == 1
      echo s:debugIndex.':'.a:level.':'.a:msg
    " Debug output to a file -- VERY SLOW!!!
    " should be OK on UNIX and Win32 (not the 95/98 variants)
    elseif g:miniBufExplDebugMode == 2
        if has('system') || has('fork')
            if has('win32') && !has('win95')
                let l:result = system("cmd /c 'echo ".s:debugIndex.':'.a:level.':'.a:msg." >> MiniBufExplorer.DBG'")
            endif
            if has('unix')
                let l:result = system("echo '".s:debugIndex.':'.a:level.':'.a:msg." >> MiniBufExplorer.DBG'")
            endif
        else
            call confirm('Error in file writing version of the debugging code, vim not compiled with system or fork. Dissabling MiniBufExplorer debugging.', 'OK')
            let g:miniBufExplDebugLevel = 0
        endif
    elseif g:miniBufExplDebugMode == 3
        let g:miniBufExplDebugOutput = g:miniBufExplDebugOutput."\n".s:debugIndex."\t".':'.a:level."\t".':'.l:msg
    endif

    let s:debugIndex = s:debugIndex + 1

    if a:level == 10 && a:msg =~ '^Leaving'
      let g:miniBufExplFuncCallDepth -= 1
    endif

    let &report  = l:save_rep
    let &showcmd = l:save_sc
  endif
endfunc

" }}}
" SwitchWindow {{{
"
function! s:SwitchWindow(action, ...)
  call <SID>DEBUG('Entering SwitchWindow('.a:action.','.string(a:000).')',10)

  if a:action !~ '[hjkltbwWpP]'
    call <SID>DEBUG('invalid window action : '.a:action,10)
    call <SID>DEBUG('Leaving SwitchWindow()',10)
    return
  endif

  if exists('a:1') && a:1 == 1
    let l:aucmd = 'noautocmd '
  else
    let l:aucmd = ''
  endif

  if exists('a:2')
    let l:winnr = a:2
  else
    let l:winnr = ''
  endif

  call <SID>DEBUG('previous window is: '.winnr(),10)
  let l:wincmd = l:aucmd.l:winnr.'wincmd '.a:action
  call <SID>DEBUG('window switching command is: '.l:wincmd,10)
  exec l:wincmd
  call <SID>DEBUG('current window is: '.winnr(),10)

  call <SID>DEBUG('Leaving SwitchWindow()',10)
endfunction

" }}}

" vim:ft=vim:fdm=marker:ff=unix:nowrap:tabstop=2:shiftwidth=2:softtabstop=2:smarttab:shiftround:expandtab
