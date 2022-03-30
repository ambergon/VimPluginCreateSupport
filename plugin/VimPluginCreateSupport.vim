" VimPluginCreateSupport
" Version: 0.0.1
" Author: ambergon
" License: MIT

"if exists('g:loaded_VimPluginCreateSupport')
"  finish
"endif
"let g:loaded_VimPluginCreateSupport = 1


command! -nargs=1   NewPlugin       call VimPluginCreateSupport#MakeFiles('<args>')
command!            NewPluginLoad   call VimPluginCreateSupport#LoadFiles()
