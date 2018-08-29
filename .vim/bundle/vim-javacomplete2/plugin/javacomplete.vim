" Java complete plugin file
" Maintainer:	artur shaik <ashaihullin@gmail.com>
" this file comtains command,custom g:var init and maps

let s:save_cpo = &cpo
set cpo&vim

if exists('g:JavaComplete_PluginLoaded')
  finish
endif
let g:JavaComplete_PluginLoaded = 1

let g:JavaComplete_IsWindows = javacomplete#util#IsWindows()

if g:JavaComplete_IsWindows
  let g:PATH_SEP    = ';'
  let g:FILE_SEP    = '\'
else
  let g:PATH_SEP    = ':'
  let g:FILE_SEP    = '/'
endif

let g:JavaComplete_BaseDir =
      \ get(g:, 'JavaComplete_BaseDir', expand('~'. g:FILE_SEP. '.cache'))

let g:JavaComplete_ImportDefault =
      \ get(g:, 'JavaComplete_ImportDefault', 0)

let g:JavaComplete_ShowExternalCommandsOutput =
      \ get(g:, 'JavaComplete_ShowExternalCommandsOutput', 0)

let g:JavaComplete_ClasspathGenerationOrder =
      \ get(g:, 'g:JavaComplete_ClasspathGenerationOrder', ['Eclipse', 'Maven', 'Gradle'])

let g:JavaComplete_ImportSortType =
      \ get(g:, 'JavaComplete_ImportSortType', 'jarName')

let g:JavaComplete_ImportOrder =
      \ get(g:, 'JavaComplete_ImportOrder', ['java.', 'javax.', 'com.', 'org.', 'net.'])

let g:JavaComplete_StaticImportsAtTop =
      \ get(g:, 'JavaComplete_StaticImportsAtTop', 0)

let g:JavaComplete_RegularClasses =
      \ get(g:, 'JavaComplete_RegularClasses', ['java.lang.String', 'java.lang.Object', 'java.lang.Exception', 'java.lang.StringBuilder', 'java.lang.Override', 'java.lang.UnsupportedOperationException', 'java.math.BigDecimal', 'java.lang.Byte', 'java.lang.Short', 'java.lang.Integer', 'java.lang.Long', 'java.lang.Float', 'java.lang.Double', 'java.lang.Character', 'java.lang.Boolean'])

let g:JaveComplete_AutoStartServer = 
      \ get(g:, 'JaveComplete_AutoStartServer', 1)

let g:JavaComplete_CompletionResultSort =
      \ get(g:, 'JavaComplete_CompletionResultSort', 0)

command! JCDisable call javacomplete#Disable()
command! JCEnable call javacomplete#Enable()

command! JCimportsAddMissing call javacomplete#imports#AddMissing()
command! JCimportsRemoveUnused call javacomplete#imports#RemoveUnused()
command! JCimportsSort call javacomplete#imports#SortImports()
command! JCimportAddSmart call javacomplete#imports#Add(1)
command! JCimportAdd call javacomplete#imports#Add()

command! JCGetSymbolType call javacomplete#imports#getType()

command! JCserverShowPort call javacomplete#server#ShowPort()
command! JCserverShowPID call javacomplete#server#ShowPID()
command! JCserverStart call javacomplete#server#Start()
command! JCserverTerminate call javacomplete#server#Terminate()
command! JCserverCompile call javacomplete#server#Compile()
command! JCserverLog call javacomplete#server#GetLogContent()
command! JCserverEnableDebug call javacomplete#server#EnableDebug()
command! JCserverEnableTraceDebug call javacomplete#server#EnableTraceDebug()

command! JCdebugEnableLogs call javacomplete#logger#Enable()
command! JCdebugDisableLogs call javacomplete#logger#Disable()
command! JCdebugGetLogContent call javacomplete#logger#GetContent()

command! JCcacheClear call javacomplete#ClearCache()

command! JCstart call javacomplete#Start()

command! JCgenerateAbstractMethods call javacomplete#generators#AbstractDeclaration()
command! JCgenerateAccessors call javacomplete#generators#Accessors()
command! JCgenerateAccessorSetter call javacomplete#generators#Accessor('s')
command! JCgenerateAccessorGetter call javacomplete#generators#Accessor('g')
command! JCgenerateAccessorSetterGetter call javacomplete#generators#Accessor('sg')
command! JCgenerateToString call javacomplete#generators#GenerateToString()
command! JCgenerateEqualsAndHashCode call javacomplete#generators#GenerateEqualsAndHashCode()
command! JCgenerateConstructor call javacomplete#generators#GenerateConstructor(0)
command! JCgenerateConstructorDefault call javacomplete#generators#GenerateConstructor(1)

command! JCclasspathGenerate call javacomplete#classpath#classpath#RebuildClassPath()

command! JCclassNew call javacomplete#newclass#CreateClass()
command! JCclassInFile call javacomplete#newclass#CreateInFile()

if g:JaveComplete_AutoStartServer
  autocmd Filetype java,jsp JCstart
endif

function! s:nop(s)
  return ''
endfunction

nnoremap <silent> <Plug>(JavaComplete-Imports-AddMissing) :call javacomplete#imports#AddMissing()<cr>
inoremap <silent> <Plug>(JavaComplete-Imports-AddMissing) <c-r>=<SID>nop(javacomplete#imports#AddMissing())<cr>
nnoremap <silent> <Plug>(JavaComplete-Imports-RemoveUnused) :call javacomplete#imports#RemoveUnused()<cr>
inoremap <silent> <Plug>(JavaComplete-Imports-RemoveUnused) <c-r>=<SID>nop(javacomplete#imports#RemoveUnused())<cr>
nnoremap <silent> <Plug>(JavaComplete-Imports-Add) :call javacomplete#imports#Add()<cr>
inoremap <silent> <Plug>(JavaComplete-Imports-Add) <c-r>=<SID>nop(javacomplete#imports#Add())<cr>
nnoremap <silent> <Plug>(JavaComplete-Imports-AddSmart) :call javacomplete#imports#Add(1)<cr>
inoremap <silent> <Plug>(JavaComplete-Imports-AddSmart) <c-r>=<SID>nop(javacomplete#imports#Add(1))<cr>
nnoremap <silent> <Plug>(JavaComplete-Generate-AbstractMethods) :call javacomplete#generators#AbstractDeclaration()<cr>
inoremap <silent> <Plug>(JavaComplete-Generate-AbstractMethods) <c-r>=<SID>nop(javacomplete#generators#AbstractDeclaration())<cr>
nnoremap <silent> <Plug>(JavaComplete-Generate-Accessors) :call javacomplete#generators#Accessors()<cr>
nnoremap <silent> <Plug>(JavaComplete-Generate-AccessorSetter) :call javacomplete#generators#Accessor('s')<cr>
nnoremap <silent> <Plug>(JavaComplete-Generate-AccessorGetter) :call javacomplete#generators#Accessor('g')<cr>
nnoremap <silent> <Plug>(JavaComplete-Generate-AccessorSetterGetter) :call javacomplete#generators#Accessor('sg')<cr>
inoremap <silent> <Plug>(JavaComplete-Generate-AccessorSetter) <c-r>=<SID>nop(javacomplete#generators#Accessor('s'))<cr>
inoremap <silent> <Plug>(JavaComplete-Generate-AccessorGetter) <c-r>=<SID>nop(javacomplete#generators#Accessor('g'))<cr>
inoremap <silent> <Plug>(JavaComplete-Generate-AccessorSetterGetter) <c-r>=<SID>nop(javacomplete#generators#Accessor('sg'))<cr>
vnoremap <silent> <Plug>(JavaComplete-Generate-AccessorSetter) :call javacomplete#generators#Accessor('s')<cr>
vnoremap <silent> <Plug>(JavaComplete-Generate-AccessorGetter) :call javacomplete#generators#Accessor('g')<cr>
vnoremap <silent> <Plug>(JavaComplete-Generate-AccessorSetterGetter) :call javacomplete#generators#Accessor('sg')<cr>
nnoremap <silent> <Plug>(JavaComplete-Generate-ToString) :call javacomplete#generators#GenerateToString()<cr>
nnoremap <silent> <Plug>(JavaComplete-Generate-EqualsAndHashCode) :call javacomplete#generators#GenerateEqualsAndHashCode()<cr>
nnoremap <silent> <Plug>(JavaComplete-Generate-Constructor) :call javacomplete#generators#GenerateConstructor(0)<cr>
nnoremap <silent> <Plug>(JavaComplete-Generate-DefaultConstructor) :call javacomplete#generators#GenerateConstructor(1)<cr>
nnoremap <silent> <Plug>(JavaComplete-Generate-NewClass) :call javacomplete#newclass#CreateClass()<cr>
nnoremap <silent> <Plug>(JavaComplete-Generate-ClassInFile) :call javacomplete#newclass#CreateInFile()<cr>
nnoremap <silent> <Plug>(JavaComplete-Imports-SortImports) :call javacomplete#imports#SortImports()<cr>
inoremap <silent> <Plug>(JavaComplete-Imports-SortImports) <c-r>=<SID>nop(javacomplete#imports#SortImports())<cr>

let &cpo = s:save_cpo
unlet s:save_cpo

autocmd User CmSetup call cm#sources#java#register()
" vim:set fdm=marker sw=2 nowrap:
