" Vim completion script for java
" Maintainer:	artur shaik <ashaihullin@gmail.com>

if exists('g:JavaComplete_Autoload')
  finish
endif
let g:JavaComplete_Autoload = 1

" It doesn't make sense to do any work if vim doesn't support any Python since
" we relly on it to properly work.
if get(g:, 'JavaComplete_UsePython3', 0) == 0 && has('python')
  command! -nargs=1 JavacompletePy py <args>
  command! -nargs=1 JavacompletePyfile pyfile <args>
elseif has("python3")
  command! -nargs=1 JavacompletePy py3 <args>
  command! -nargs=1 JavacompletePyfile py3file <args>
else
  echoerr "Javacomplete needs Python support to run!"
  finish
endif

function! s:Log(log)
  let log = type(a:log) == type("") ? a:log : string(a:log)
  call javacomplete#logger#Log("[javacomplete] ". a:log)
endfunction

let g:J_ARRAY_TYPE_MEMBERS = [
      \	{'kind': 'm',		'word': 'clone(',	'abbr': 'clone()',	'menu': 'Object clone()', },
      \	{'kind': 'm',		'word': 'equals(',	'abbr': 'equals()',	'menu': 'boolean equals(Object)', },
      \	{'kind': 'm',		'word': 'getClass(',	'abbr': 'getClass()',	'menu': 'Class Object.getClass()', },
      \	{'kind': 'm',		'word': 'hashCode(',	'abbr': 'hashCode()',	'menu': 'int hashCode()', },
      \	{'kind': 'f',		'word': 'length',				'menu': 'int'},
      \	{'kind': 'm',		'word': 'notify(',	'abbr': 'notify()',	'menu': 'void Object.notify()', },
      \	{'kind': 'm',		'word': 'notifyAll(',	'abbr': 'notifyAll()',	'menu': 'void Object.notifyAll()', },
      \	{'kind': 'm',		'word': 'toString(',	'abbr': 'toString()',	'menu': 'String toString()', },
      \	{'kind': 'm',		'word': 'wait(',	'abbr': 'wait()',	'menu': 'void Object.wait() throws InterruptedException', },
      \	{'kind': 'm', 'dup': 1, 'word': 'wait(',	'abbr': 'wait()',	'menu': 'void Object.wait(long timeout) throws InterruptedException', },
      \	{'kind': 'm', 'dup': 1, 'word': 'wait(',	'abbr': 'wait()',	'menu': 'void Object.wait(long timeout, int nanos) throws InterruptedException', }]

let g:J_ARRAY_TYPE_INFO = {'tag': 'CLASSDEF', 'name': '[', 'ctors': [],
      \     'fields': [{'n': 'length', 'm': '1', 't': 'int'}],
      \     'methods':[
      \	{'n': 'clone',	  'm': '1',		'r': 'Object',	'p': [],		'd': 'Object clone()'},
      \	{'n': 'equals',	  'm': '1',		'r': 'boolean',	'p': ['Object'],	'd': 'boolean Object.equals(Object obj)'},
      \	{'n': 'getClass', 'm': '100010001',	'r': 'Class',	'p': [],		'd': 'Class Object.getClass()'},
      \	{'n': 'hashCode', 'm': '100000001',	'r': 'int',	'p': [],		'd': 'int Object.hashCode()'},
      \	{'n': 'notify',	  'm': '100010001',	'r': 'void',	'p': [],		'd': 'void Object.notify()'},
      \	{'n': 'notifyAll','m': '100010001',	'r': 'void',	'p': [],		'd': 'void Object.notifyAll()'},
      \	{'n': 'toString', 'm': '1', 		'r': 'String',	'p': [],		'd': 'String Object.toString()'},
      \	{'n': 'wait',	  'm': '10001',		'r': 'void',	'p': [],		'd': 'void Object.wait() throws InterruptedException'},
      \	{'n': 'wait',	  'm': '100010001',	'r': 'void',	'p': ['long'],		'd': 'void Object.wait(long timeout) throws InterruptedException'},
      \	{'n': 'wait',	  'm': '10001',		'r': 'void',	'p': ['long','int'],	'd': 'void Object.wait(long timeout, int nanos) throws InterruptedException'},
      \    ]}

let g:J_PRIMITIVE_TYPE_INFO = {'tag': 'CLASSDEF', 'name': '!', 'fields': [{'n': 'class','m': '1','t': 'Class'}]}

let g:J_JSP_BUILTIN_OBJECTS = {'session':	'javax.servlet.http.HttpSession',
      \	'request':	'javax.servlet.http.HttpServletRequest',
      \	'response':	'javax.servlet.http.HttpServletResponse',
      \	'pageContext':	'javax.servlet.jsp.PageContext',
      \	'application':	'javax.servlet.ServletContext',
      \	'config':	'javax.servlet.ServletConfig',
      \	'out':		'javax.servlet.jsp.JspWriter',
      \	'page':		'javax.servlet.jsp.HttpJspPage', }


let g:J_PRIMITIVE_TYPES	= ['boolean', 'byte', 'char', 'int', 'short', 'long', 'float', 'double']
let g:J_KEYWORDS_MODS	= ['public', 'private', 'protected', 'static', 'final', 'synchronized', 'volatile', 'transient', 'native', 'strictfp', 'abstract']
let g:J_KEYWORDS_TYPE	= ['class', 'interface', 'enum']
let g:J_KEYWORDS		= g:J_PRIMITIVE_TYPES + g:J_KEYWORDS_MODS + g:J_KEYWORDS_TYPE + ['super', 'this', 'void'] + ['assert', 'break', 'case', 'catch', 'const', 'continue', 'default', 'do', 'else', 'extends', 'finally', 'for', 'goto', 'if', 'implements', 'import', 'instanceof', 'interface', 'new', 'package', 'return', 'switch', 'throw', 'throws', 'try', 'while', 'true', 'false', 'null']

let g:JC_MODIFIER_PUBLIC               = 1
let g:JC_MODIFIER_PROTECTED            = 3
let g:JC_MODIFIER_FINAL                = 5
let g:JC_MODIFIER_NATIVE               = 9
let g:JC_MODIFIER_ABSTRACT             = 11

let g:RE_BRACKETS	= '\%(\s*\[\s*\]\)'
let g:RE_IDENTIFIER	= '[a-zA-Z_$][a-zA-Z0-9_$]*'
let g:RE_ANNOTATION	= '@[a-zA-Z_][a-zA-Z0-9_$]*'
let g:RE_QUALID		= g:RE_IDENTIFIER. '\%(\s*\.\s*' .g:RE_IDENTIFIER. '\)*'

let g:RE_REFERENCE_TYPE	= g:RE_QUALID . g:RE_BRACKETS . '*'
let g:RE_TYPE		= g:RE_REFERENCE_TYPE

let g:RE_TYPE_ARGUMENT	= '\%(?\s\+\%(extends\|super\)\s\+\)\=' . g:RE_TYPE
let g:RE_TYPE_ARGUMENT_EXTENDS	= '\%(?\s\+\%(extends\|super\)\s\+\)' . g:RE_TYPE
let g:RE_TYPE_ARGUMENTS	= '<' . g:RE_TYPE_ARGUMENT . '\%(\s*,\s*' . g:RE_TYPE_ARGUMENT . '\)*>'
let g:RE_TYPE_WITH_ARGUMENTS_I	= g:RE_IDENTIFIER . '\s*' . g:RE_TYPE_ARGUMENTS
let g:RE_TYPE_WITH_ARGUMENTS	= g:RE_TYPE_WITH_ARGUMENTS_I . '\%(\s*' . g:RE_TYPE_WITH_ARGUMENTS_I . '\)*'

let g:RE_TYPE_MODS	= '\%(public\|protected\|private\|abstract\|static\|final\|strictfp\)'
let g:RE_TYPE_DECL_HEAD	= '\(class\|interface\|enum\)[ \t\n\r]\+'
let g:RE_TYPE_DECL	= '\<\C\(\%(' .g:RE_TYPE_MODS. '\s\+\)*\)' .g:RE_TYPE_DECL_HEAD. '\(' .g:RE_IDENTIFIER. '\)[{< \t\n\r]'

let g:RE_ARRAY_TYPE	= '^\s*\(' .g:RE_QUALID . '\)\(' . g:RE_BRACKETS . '\+\)\s*$'
let g:RE_SELECT_OR_ACCESS	= '^\s*\(' . g:RE_IDENTIFIER . '\)\s*\(\[.*\]\)\=\s*$'
let g:RE_ARRAY_ACCESS	= '^\s*\(' . g:RE_IDENTIFIER . '\)\s*\(\[.*\]\)\+\s*$'
let g:RE_CASTING	= '^\s*(\(' .g:RE_QUALID. '\))\s*\(' . g:RE_IDENTIFIER . '\)\>'

let g:RE_KEYWORDS	= '\<\%(' . join(g:J_KEYWORDS, '\|') . '\)\>'

let g:JAVA_HOME = $JAVA_HOME

let g:JavaComplete_Cache = {}	" FQN -> member list, e.g. {'java.lang.StringBuffer': classinfo, 'java.util': packageinfo, '/dir/TopLevelClass.java': compilationUnit}
let g:JavaComplete_Files = {}	" srouce file path -> properties, e.g. {filekey: {'unit': compilationUnit, 'changedtick': tick, }}

let g:JavaComplete_ProjectKey = ''

fu! SScope()
  return s:
endfu

function! javacomplete#Disable()
  let g:JavaComplete_Disabled = 1
endfunction

function! javacomplete#Enable()
  let g:JavaComplete_Disabled = 0
endfunction

function! javacomplete#ClearCache()
  let g:JavaComplete_Cache = {}
  let g:JavaComplete_Files = {}

  call javacomplete#util#RemoveFile(javacomplete#util#GetBase('cache'). g:FILE_SEP. 'class_packages_'. g:JavaComplete_ProjectKey. '.dat')
  call javacomplete#server#Communicate('-collect-packages', '', 's:ClearCache')
endfunction

function! javacomplete#Complete(findstart, base)
  return javacomplete#complete#complete#Complete(a:findstart, a:base, 1)
endfunction

" key of g:JavaComplete_Files for current buffer. It may be the full path of current file or the bufnr of unnamed buffer, and is updated when BufEnter, BufLeave.
function! javacomplete#GetCurrentFileKey()
  return s:GetCurrentFileKey()
endfunction

function! s:GetCurrentFileKey()
  return has("autocmd") ? s:curfilekey : empty(expand('%')) ? bufnr('%') : expand('%:p')
endfunction

function! s:SetCurrentFileKey()
  let s:curfilekey = empty(expand('%')) ? bufnr('%') : expand('%:p')
endfunction
call s:SetCurrentFileKey()

function! s:HandleTextChangedI()
  if get(g:, 'JC_ClassnameCompletedFlag', 0) && get(g:, 'JavaComplete_InsertImports', 1)
    let saveCursor = getcurpos()
    let line = getline('.')
    if empty(javacomplete#util#Trim(line))
      call cursor(line('.') - 1, 500)
      let line = getline('.')
      let offset = 1
    else
      if line[col('.') - 2] !~ '\v(\s|\.|\(|\<)'
        return
      endif
      let offset = 0
    endif

    let g:JC_ClassnameCompletedFlag = 0
    call javacomplete#imports#Add()
    let saveCursor[1] = line('.') + offset
    call setpos('.', saveCursor)
  endif

  if get(g:, 'JC_DeclarationCompletedFlag', 0)
    let line = getline('.')
    if line[col('.') - 2] != ' '
      return
    endif

    let g:JC_DeclarationCompletedFlag = 0

    if line !~ '.*@Override.*'
      let line = getline(line('.') - 1)
    endif

    if line =~ '.*@Override\s\+\(\S\+\|\)\(\s\+\|\)$'
      return
    endif

    if !empty(javacomplete#util#Trim(getline('.')))
      call feedkeys("\b\r", "n")
    endif
    if get(g:, 'JavaComplete_ClosingBrace', 1)
      call feedkeys("}\eO", "n")
    endif
  endif
endfunction

function! s:HandleInsertLeave()
  if get(g:, 'JC_DeclarationCompletedFlag', 0)
    let g:JC_DeclarationCompletedFlag = 0
  endif
  if get(g:, 'JC_ClassnameCompletedFlag', 0)
    let g:JC_ClassnameCompletedFlag = 0
  endif
endfunction

function! javacomplete#UseFQN()
  return get(g:, 'JavaComplete_UseFQN', 0)
endfunction

function! s:RemoveCurrentFromCache()
  let package = javacomplete#complete#complete#GetPackageName()
  let classname = split(expand('%:t'), '\.')[0]
  let fqn = package. '.'. classname
  if has_key(g:JavaComplete_Cache, fqn)
    call remove(g:JavaComplete_Cache, fqn)
  endif
  call javacomplete#server#Communicate('-clear-from-cache', fqn, 's:RemoveCurrentFromCache')
  call javacomplete#server#Communicate('-async -recompile-class', fqn, 's:RemoveCurrentFromCache')

  let arguments = '-source '. resolve(expand('%:p'))
  let arguments .= ' -class '. classname
  let arguments .= ' -package '. package
  call javacomplete#server#Communicate('-async -add-source-to-cache', arguments, 's:RemoveCurrentFromCache')
endfunction

function! s:DefaultMappings()
  if !get(g:, "JavaComplete_EnableDefaultMappings", 1)
    return
  endif

  nmap <silent> <buffer> <leader>jI <Plug>(JavaComplete-Imports-AddMissing)
  nmap <silent> <buffer> <leader>jR <Plug>(JavaComplete-Imports-RemoveUnused)
  nmap <silent> <buffer> <leader>ji <Plug>(JavaComplete-Imports-AddSmart)
  nmap <silent> <buffer> <leader>jii <Plug>(JavaComplete-Imports-Add)
  nmap <silent> <buffer> <leader>jis <Plug>(JavaComplete-Imports-SortImports)

  imap <silent> <buffer> <C-j>I <Plug>(JavaComplete-Imports-AddMissing)
  imap <silent> <buffer> <C-j>R <Plug>(JavaComplete-Imports-RemoveUnused)
  imap <silent> <buffer> <C-j>i <Plug>(JavaComplete-Imports-AddSmart)
  imap <silent> <buffer> <C-j>ii <Plug>(JavaComplete-Imports-Add)

  nmap <silent> <buffer> <leader>jM <Plug>(JavaComplete-Generate-AbstractMethods)

  imap <silent> <buffer> <C-j>jM <Plug>(JavaComplete-Generate-AbstractMethods)

  nmap <silent> <buffer> <leader>jA <Plug>(JavaComplete-Generate-Accessors)
  nmap <silent> <buffer> <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
  nmap <silent> <buffer> <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
  nmap <silent> <buffer> <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)
  nmap <silent> <buffer> <leader>jts <Plug>(JavaComplete-Generate-ToString)
  nmap <silent> <buffer> <leader>jeq <Plug>(JavaComplete-Generate-EqualsAndHashCode)
  nmap <silent> <buffer> <leader>jc <Plug>(JavaComplete-Generate-Constructor)
  nmap <silent> <buffer> <leader>jcc <Plug>(JavaComplete-Generate-DefaultConstructor)

  imap <silent> <buffer> <C-j>s <Plug>(JavaComplete-Generate-AccessorSetter)
  imap <silent> <buffer> <C-j>g <Plug>(JavaComplete-Generate-AccessorGetter)
  imap <silent> <buffer> <C-j>a <Plug>(JavaComplete-Generate-AccessorSetterGetter)

  vmap <silent> <buffer> <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
  vmap <silent> <buffer> <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
  vmap <silent> <buffer> <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)

  nmap <silent> <buffer> <leader>jn <Plug>(JavaComplete-Generate-NewClass)
  nmap <silent> <buffer> <leader>jN <Plug>(JavaComplete-Generate-ClassInFile)
endfunction

augroup javacomplete
  autocmd!
  autocmd BufEnter *.java,*.jsp call s:SetCurrentFileKey()
  autocmd BufEnter *.java call s:DefaultMappings()
  autocmd BufWritePost *.java call s:RemoveCurrentFromCache()
  autocmd VimLeave * call javacomplete#server#Terminate()

  if v:version > 704 || v:version == 704 && has('patch143')
    autocmd TextChangedI *.java,*.jsp call s:HandleTextChangedI()
  else
    echohl WarningMsg
    echomsg "JavaComplete2 : TextChangedI feature needs vim version >= 7.4.143"
    echohl None
  endif
  autocmd InsertLeave *.java,*.jsp call s:HandleInsertLeave()
augroup END

let g:JavaComplete_Home = fnamemodify(expand('<sfile>'), ':p:h:h:gs?\\?'. g:FILE_SEP. '?')
let g:JavaComplete_JavaParserJar = fnamemodify(g:JavaComplete_Home. join(['', 'libs', 'javaparser-core-3.5.20.jar'], g:FILE_SEP), ":p")

call s:Log("JavaComplete_Home: ". g:JavaComplete_Home)

let g:JavaComplete_SourcesPath = get(g:, 'JavaComplete_SourcesPath', ''). g:PATH_SEP
      \. join(filter(javacomplete#util#GlobPathList(getcwd(), 'src', 0, 3), "match(v:val, '.*build.*') < 0"), g:PATH_SEP)

if filereadable(getcwd(). g:FILE_SEP. "build.gradle")
    let g:JavaComplete_SourcesPath = g:JavaComplete_SourcesPath
          \. g:PATH_SEP
          \. join(javacomplete#util#GlobPathList(getcwd()
          \, join(['**', 'build', 'generated', 'source', '**', 'debug'], g:FILE_SEP), 0, 0)
          \, g:PATH_SEP)
endif

call s:Log("Default sources: ". g:JavaComplete_SourcesPath)

if exists('g:JavaComplete_LibsPath')
  let g:JavaComplete_LibsPath .= g:PATH_SEP
else
  let g:JavaComplete_LibsPath = ""
endif

call javacomplete#classpath#classpath#BuildClassPath()

function! javacomplete#Start()
  call javacomplete#server#Start()
endfunction

" vim:set fdm=marker sw=2 nowrap:
