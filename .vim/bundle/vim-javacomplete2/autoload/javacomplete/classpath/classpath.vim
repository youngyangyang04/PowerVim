function! javacomplete#classpath#classpath#BuildClassPath()
  call s:BuildClassPath(0)
endfunction

function! javacomplete#classpath#classpath#RebuildClassPath()
  call s:BuildClassPath(1)
endfunction

function! s:BuildClassPath(force)
  if !get(g:, 'JavaComplete_MavenRepositoryDisabled', 0)
    if !exists('g:JavaComplete_PomPath')
      let g:JavaComplete_PomPath = javacomplete#util#FindFile('pom.xml')
      if g:JavaComplete_PomPath != ""
        let g:JavaComplete_PomPath = fnamemodify(g:JavaComplete_PomPath, ':p')
      endif
    endif
  endif

  if !get(g:, 'JavaComplete_GradleRepositoryDisabled', 0)
    if !exists('g:JavaComplete_GradlePath')
      if filereadable(getcwd(). g:FILE_SEP. "build.gradle")
        let g:JavaComplete_GradlePath = getcwd(). g:FILE_SEP. "build.gradle"
      else
        let g:JavaComplete_GradlePath = javacomplete#util#FindFile('build.gradle', '**3')
      endif
      if g:JavaComplete_GradlePath != ""
        let g:JavaComplete_GradlePath = fnamemodify(g:JavaComplete_GradlePath, ':p')
      endif
    endif
  endif

  let g:JavaComplete_LibsPath .= s:FindClassPath(a:force)
endfunction

function! s:ReadClassPathFile(classpathFile)
  let cp = ''
  let file = g:JavaComplete_Home. join(['', 'autoload', 'classpath.py'], g:FILE_SEP)
  execute "JavacompletePyfile" file
  JavacompletePy import vim
  JavacompletePy vim.command("let cp = '%s'" % os.pathsep.join(ReadClasspathFile(vim.eval('a:classpathFile'))).replace('\\', '/'))
  return cp
endfunction

function! s:UseEclipse(force)
  if has('python') || has('python3')
    let classpathFile = fnamemodify(findfile('.classpath', escape(expand('.'), '*[]?{}, ') . ';'), ':p')
    if !empty(classpathFile) && filereadable(classpathFile)
      return s:ReadClassPathFile(classpathFile)
    endif
  endif

  return ""
endf

function! s:UseMaven(force)
  if javacomplete#classpath#maven#IfMaven()
    return javacomplete#classpath#maven#Generate(a:force)
  endif

  return ""
endf

function! s:UseGradle(force)
  if javacomplete#classpath#gradle#IfGradle()
    return javacomplete#classpath#gradle#Generate(a:force)
  endif

  return ""
endf

function! s:FindClassPath(force) abort
  for classpathSourceType in g:JavaComplete_ClasspathGenerationOrder
    try
      let cp = ''
      exec "let cp .= s:Use". classpathSourceType. "(". a:force. ")"
      if !empty(cp)
        return '.' . g:PATH_SEP . cp
      endif
    catch
    endtry
  endfor

  return '.'
endfunction

" vim:set fdm=marker sw=2 nowrap:
