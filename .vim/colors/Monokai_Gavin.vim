" Vim color file, Gavin modified
" Converted from Textmate theme Monokai using Coloration v0.3.2 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "Monokai_Gavin"
let s:t_Co = ""
let s:t_Co .= &t_Co
if s:t_Co == ""
  echo "gui 2^32 colors"
 let s:t_Co = 10000
else
 let s:t_Co = &t_Co
endif

if s:t_Co > 255

hi Cursor ctermfg=232 ctermbg=15 cterm=NONE guifg=#272822 guibg=#f8f8f0 gui=NONE
hi Visual ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#49483e gui=NONE
hi CursorLine ctermfg=NONE ctermbg=237 cterm=NONE guifg=NONE guibg=#3c3d37 gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=237 cterm=NONE guifg=NONE guibg=#3c3d37 gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=237 cterm=NONE guifg=NONE guibg=#3c3d37 gui=NONE
hi LineNr ctermfg=102 ctermbg=237 cterm=NONE guifg=#90908a guibg=#3c3d37 gui=NONE
hi VertSplit ctermfg=241 ctermbg=241 cterm=NONE guifg=#64645e guibg=#64645e gui=NONE
" hi MatchParen ctermfg=197 ctermbg=NONE cterm=underline guifg=#f92672 guibg=NONE gui=underline
hi MatchParen ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
" hi StatusLine ctermfg=15 ctermbg=241 cterm=bold guifg=#f8f8f2 guibg=#64645e gui=bold
" current file status line
" hi StatusLine ctermfg=226 ctermbg=241 cterm=bold guifg=#ffff00 guibg=#64645e gui=bold
hi StatusLine ctermfg=16 ctermbg=227 cterm=NONE guifg=#000000 guibg=#ffff5f gui=NONE
hi TabLineSel ctermfg=16 ctermbg=154 cterm=NONE guifg=#000000 guibg=#afff00 gui=NONE
" hi TabLine ctermfg=16 ctermbg=227 cterm=NONE guifg=#000000 guibg=#ffff5a gui=NONE
" not current(NC) status line
hi StatusLineNC ctermfg=15 ctermbg=241 cterm=NONE guifg=#f8f8f2 guibg=#64645e gui=NONE
hi Pmenu ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#49483e gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=197 cterm=NONE guifg=NONE guibg=#f92672 gui=NONE
hi PmenuSbar ctermfg=NONE ctermbg=7 guifg=NONE guibg=#c0c0c0
hi PmenuThumb ctermfg=46 ctermbg=46 guifg=#00ff00 guibg=#00ff00
hi IncSearch ctermfg=232 ctermbg=186 cterm=NONE guifg=#272822 guibg=#e6db74 gui=NONE
" hi Search ctermfg=15 ctermbg=40 cterm=NONE guifg=#ffffff guibg=#2c9026 gui=NONE
hi Search ctermfg=0 ctermbg=228 cterm=NONE guifg=#000000 guibg=#ffff00 gui=NONE
hi Directory ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi Folded ctermfg=242 ctermbg=232 cterm=NONE guifg=#75715e guibg=#272822 gui=NONE
hi FoldColumn ctermfg=102 ctermbg=237 cterm=NONE guifg=#90908a guibg=#3c3d37 gui=NONE

hi Normal ctermfg=15 ctermbg=232 cterm=NONE guifg=#ffffff guibg=#000000 gui=NONE
hi Boolean ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi Character ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
" hi Comment ctermfg=242 ctermbg=NONE cterm=NONE guifg=#75715e guibg=NONE gui=NONE
hi Comment ctermfg=40 ctermbg=NONE cterm=NONE guifg=#00e000 guibg=NONE gui=NONE
hi Conditional ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi Constant ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi Define ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi DiffAdd ctermfg=15 ctermbg=64 cterm=bold guifg=#f8f8f2 guibg=#46830c gui=bold
hi DiffDelete ctermfg=88 ctermbg=NONE cterm=NONE guifg=#8b0807 guibg=NONE gui=NONE
hi DiffChange ctermfg=15 ctermbg=23 cterm=NONE guifg=#f8f8f2 guibg=#243955 gui=NONE
hi DiffText ctermfg=15 ctermbg=24 cterm=bold guifg=#f8f8f2 guibg=#204a87 gui=bold
hi ErrorMsg ctermfg=15 ctermbg=197 cterm=NONE guifg=#f8f8f0 guibg=#f92672 gui=NONE
hi WarningMsg ctermfg=15 ctermbg=197 cterm=NONE guifg=#f8f8f0 guibg=#f92672 gui=NONE
hi Float ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
" hi Function ctermfg=148 ctermbg=NONE cterm=NONE guifg=#a6e22e guibg=NONE gui=bold
hi Identifier ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=italic
hi Keyword ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi Label ctermfg=186 ctermbg=NONE cterm=NONE guifg=#e6db74 guibg=NONE gui=NONE
" The "NonText" highlighting will be used for "eol", "extends" and "precedes".
" "SpecialKey" for "nbsp", "tab" and "trail".
hi NonText ctermfg=59 ctermbg=236 cterm=NONE guifg=#49483e guibg=#31322c gui=NONE
hi Number ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
"hi Operator ctermfg=197 ctermbg=NONE cterm=NONE guifg=#d8d8d8 guibg=NONE gui=NONE
hi Operator ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi PreProc ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi Special ctermfg=15 ctermbg=NONE cterm=NONE guifg=#f8f8f2 guibg=NONE gui=NONE
"hi SpecialKey ctermfg=59 ctermbg=237 cterm=NONE guifg=#49483e guibg=#3c3d37 gui=NONE
hi SpecialKey ctermfg=235 ctermbg=NONE cterm=NONE guifg=#262626 guibg=NONE gui=NONE
hi Statement ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi StorageClass ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=italic
" hi String ctermfg=186 ctermbg=NONE cterm=NONE guifg=#e6db74 guibg=NONE gui=NONE
hi String ctermfg=166 ctermbg=NONE cterm=NONE guifg=#df5f00 guibg=NONE gui=NONE
hi Tag ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi Title ctermfg=15 ctermbg=NONE cterm=bold guifg=#f8f8f2 guibg=NONE gui=bold
hi Todo ctermfg=95 ctermbg=NONE cterm=inverse,bold guifg=#75715e guibg=NONE gui=inverse,bold
" hi Type ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
" hi Type ctermfg=27 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi Type ctermfg=27 ctermbg=NONE cterm=NONE guifg=#409fff guibg=NONE gui=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi Exception ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi Typedef ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
" spell highlight
hi SpellBad ctermfg=255 ctermbg=203 cterm=NONE guifg=NONE guibg=NONE gui=undercurl guisp=Red
hi SpellCap ctermfg=255 ctermbg=12 cterm=NONE guifg=NONE guibg=NONE gui=undercurl guisp=Blue
hi SpellRare ctermfg=255 ctermbg=13 cterm=NONE guifg=NONE guibg=NONE gui=undercurl guisp=Magenta

" ruby javascript css colorscheme
hi rubyClass ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi rubyFunction ctermfg=148 ctermbg=NONE cterm=NONE guifg=#a6e22e guibg=NONE gui=NONE
hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubySymbol ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi rubyConstant ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=italic
hi rubyStringDelimiter ctermfg=186 ctermbg=NONE cterm=NONE guifg=#e6db74 guibg=NONE gui=NONE
hi rubyBlockParameter ctermfg=208 ctermbg=NONE cterm=NONE guifg=#fd971f guibg=NONE gui=italic
hi rubyInstanceVariable ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyInclude ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi rubyGlobalVariable ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyRegexp ctermfg=186 ctermbg=NONE cterm=NONE guifg=#e6db74 guibg=NONE gui=NONE
hi rubyRegexpDelimiter ctermfg=186 ctermbg=NONE cterm=NONE guifg=#e6db74 guibg=NONE gui=NONE
hi rubyEscape ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi rubyControl ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi rubyClassVariable ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyOperator ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi rubyException ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi rubyPseudoVariable ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyRailsUserClass ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=italic
hi rubyRailsARAssociationMethod ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi rubyRailsARMethod ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi rubyRailsRenderMethod ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi rubyRailsMethod ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi erubyDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi erubyComment ctermfg=95 ctermbg=NONE cterm=NONE guifg=#75715e guibg=NONE gui=NONE
hi erubyRailsMethod ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi htmlTag ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlEndTag ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlTagName ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlArg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlSpecialChar ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi javaScriptFunction ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=italic
hi javaScriptRailsFunction ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlKey ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi yamlAnchor ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlAlias ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlDocumentHeader ctermfg=186 ctermbg=NONE cterm=NONE guifg=#e6db74 guibg=NONE gui=NONE
hi cssURL ctermfg=208 ctermbg=NONE cterm=NONE guifg=#fd971f guibg=NONE gui=italic
hi cssFunctionName ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi cssColor ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi cssPseudoClassId ctermfg=148 ctermbg=NONE cterm=NONE guifg=#a6e22e guibg=NONE gui=NONE
hi cssClassName ctermfg=148 ctermbg=NONE cterm=NONE guifg=#a6e22e guibg=NONE gui=NONE
hi cssValueLength ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi cssCommonAttr ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi cssBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE

" customized colors for future use
hi PureRed ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ff0000 guibg=NONE gui=NONE
hi PureGreen ctermfg=15 ctermbg=NONE cterm=NONE guifg=#00ff00 guibg=NONE gui=NONE
hi PureBlue ctermfg=15 ctermbg=NONE cterm=NONE guifg=#0000ff guibg=NONE gui=NONE
hi PureYellow ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffff00 guibg=NONE gui=NONE
hi PureCyan ctermfg=15 ctermbg=NONE cterm=NONE guifg=#00ffff guibg=NONE gui=NONE
hi PurePurple ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ff00ff guibg=NONE gui=NONE
hi PureGray ctermfg=15 ctermbg=NONE cterm=NONE guifg=#888888 guibg=NONE gui=NONE

hi BlackOnYellow ctermfg=16 ctermbg=227 cterm=NONE guifg=#000000 guibg=#ffff5f gui=bold

hi Red ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi Green ctermfg=40 ctermbg=NONE cterm=NONE guifg=#00e000 guibg=NONE gui=NONE
hi Blue ctermfg=27 ctermbg=NONE cterm=NONE guifg=#409fff guibg=NONE gui=NONE
hi Yellow ctermfg=186 ctermbg=NONE cterm=NONE guifg=#e6db74 guibg=NONE gui=NONE
hi Cyan ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=none
hi YellowGreen ctermfg=148 ctermbg=NONE cterm=NONE guifg=#a6e22e guibg=NONE gui=NONE
hi Purple ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi Gray ctermfg=59 ctermbg=NONE cterm=NONE guifg=#49483e guibg=NONE gui=NONE

hi ErrorColor ctermfg=15 ctermbg=197 cterm=NONE guifg=#f8f8f0 guibg=#f92672 gui=NONE
hi ErrorColor ctermfg=15 ctermbg=197 cterm=NONE guifg=#f8f8f0 guibg=#f92672 gui=NONE
hi Url ctermfg=27 ctermbg=NONE cterm=underline guifg=#409fff guibg=NONE gui=underline
hi def link UrlLink Url
hi def link HttpLink UrlLink

hi Bold ctermfg=15 ctermbg=232 cterm=bold guifg=#f8f8f2 guibg=#272822 gui=Bold
hi Italic ctermfg=15 ctermbg=232 cterm=bold guifg=#f8f8f2 guibg=#272822 gui=italic

endif " 256 colors 

" for 8-color and 16-color terminal
if s:t_Co < 255
" set to 8 colors
" white gray darkgray black, lightblue blue darkblue, lightcryan cryan darkcyan, lightgreen green darkgreen, lightred red darkred
" lightyellow yellow darkyellow
" in 8-color termnal white is bold with special(undifinded, terminal) background
set bg=dark
hi Normal guifg=#c0c0c0 guibg=#000040 ctermfg=gray ctermbg=black
hi ErrorMsg guifg=#ffffff guibg=#287eff ctermfg=white ctermbg=lightblue
hi Visual guifg=#8080ff guibg=fg gui=reverse ctermfg=lightblue ctermbg=fg cterm=reverse
hi VisualNOS guifg=#8080ff guibg=fg gui=reverse,underline ctermfg=lightblue ctermbg=fg cterm=reverse,underline
hi Todo guifg=#d14a14 guibg=#1248d1 ctermfg=red ctermbg=darkblue
hi Search guifg=#90fff0 guibg=#2050d0 ctermfg=white ctermbg=darkgreen cterm=NONE term=NONE
hi IncSearch guifg=#b0ffff guibg=#2050d0 ctermfg=darkblue ctermbg=gray

hi SpecialKey guifg=NONE ctermfg=black
hi Directory guifg=cyan ctermfg=cyan
hi Title guifg=magenta gui=none ctermfg=magenta cterm=bold
hi WarningMsg guifg=red ctermfg=red
hi WildMenu guifg=yellow guibg=black ctermfg=yellow ctermbg=black cterm=none term=none
" hi ModeMsg guifg=#22cce2 ctermfg=lightblue
hi ModeMsg guifg=#22cce2 ctermfg=yellow
hi MoreMsg ctermfg=darkgreen ctermfg=darkgreen
hi Question guifg=green gui=none ctermfg=green cterm=none
hi NonText guifg=#0030ff ctermfg=darkblue

" hi StatusLine guifg=blue guibg=darkgray gui=none ctermfg=blue ctermbg=gray term=none cterm=none
hi StatusLine ctermfg=yellow ctermbg=darkgray cterm=bold guifg=#ffff00 guibg=#64645e gui=bold
" hi StatusLineNC guifg=black guibg=darkgray gui=none ctermfg=black ctermbg=gray term=none cterm=none
hi StatusLineNC ctermfg=gray ctermbg=darkgray cterm=NONE guifg=#f8f8f2 guibg=#64645e gui=NONE
hi VertSplit guifg=black guibg=darkgray gui=none ctermfg=black ctermbg=gray term=none cterm=none

hi Folded guifg=#90908a guibg=#3c3d37 gui=NONE ctermfg=darkgrey ctermbg=black cterm=bold term=bold
hi FoldColumn guifg=#90908a guibg=#3c3d37 gui=NONE ctermfg=darkgrey ctermbg=black cterm=bold term=bold
hi LineNr guifg=#90f020 ctermfg=darkyellow cterm=none

hi DiffAdd guibg=darkblue ctermbg=darkblue term=none cterm=none
hi DiffChange guibg=darkmagenta ctermbg=magenta cterm=none
hi DiffDelete ctermfg=blue ctermbg=cyan gui=bold guifg=Blue guibg=DarkCyan
hi DiffText cterm=bold ctermbg=red gui=bold guibg=Red

" hi Cursor guifg=black guibg=yellow ctermfg=black ctermbg=yellow
hi Cursor guifg=black guibg=yellow ctermfg=black ctermbg=white
hi lCursor guifg=black guibg=white ctermfg=black ctermbg=white


" hi Comment guifg=#80a0ff ctermfg=darkred
hi Comment guifg=#80a0ff ctermfg=darkgreen
hi Constant ctermfg=magenta guifg=#ffa0a0 cterm=none
hi Special ctermfg=brown guifg=Orange cterm=none gui=none
hi Identifier ctermfg=cyan guifg=#40ffff cterm=none
hi Statement ctermfg=yellow cterm=none guifg=#ffff60 gui=none
hi PreProc ctermfg=magenta guifg=#ff80ff gui=none cterm=none
hi type ctermfg=cyan guifg=#60ff60 gui=none cterm=none
hi Underlined cterm=underline term=underline
hi Ignore guifg=none ctermfg=none

" suggested by tigmoid, 2008 Jul 18
hi Pmenu guifg=#c0c0c0 guibg=#404080 ctermfg=white ctermbg=darkgray
hi PmenuSel guifg=#c0c0c0 guibg=#2050d0 ctermfg=white ctermbg=magenta
hi PmenuSbar guifg=blue guibg=darkgray ctermfg=blue ctermbg=darkgray
hi PmenuThumb guifg=#c0c0c0 ctermfg=green ctermbg=green

" added 
hi MatchParen ctermfg=black ctermbg=green cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi CursorLine ctermfg=NONE ctermbg=darkblue cterm=NONE guifg=NONE guibg=#3c3d37 gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=darkblue cterm=NONE guifg=NONE guibg=#3c3d37 gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=darkblue cterm=NONE guifg=NONE guibg=#3c3d37 gui=NONE
hi Exception ctermfg=cyan ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi Typedef ctermfg=cyan ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi Funciton ctermfg=darkcyan ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE

endif " 8 colors

