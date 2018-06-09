"------------------------"
"FileType SETTINGS
"------------------------"
""au FileType javascript call JavaScriptFold()
" CSS (tabs = 2, lines = 79)
""autocmd FileType css set omnifunc=csscomplete#CompleteCSS
""autocmd FileType css set sw=2
""autocmd FileType css set ts=2
""autocmd FileType css set sts=2
""" " JavaScript (tabs = 4, lines = 79)
""autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
""autocmd FileType javascript set sw=4
""autocmd FileType javascript set ts=4
""autocmd FileType javascript set sts=4
"""autocmd FileType javascript set tw=79
""
""" Jade (tabs = 2)
""autocmd FileType jade set omnifunc=jadecomplete#CompleteJade
""autocmd FileType jade set sw=2
""autocmd FileType jade set ts=2
""autocmd FileType jade set sts=2

" Vue syntax highligting
""autocmd BufNewFile,BufRead *.vue set ft=html
au BufNewFile,BufReadPost *.vue set syntax=html

"------------------------"
" map json files correctly
"------------------------"
" Ensure json files set to the right type automatically"
au BufRead,BufNewFile *.json set filetype=json

"------------------------"
" ALE Linter configs
"------------------------"
let g:ale_linters = {
\   'javascript': ['eslint'],
\}

" keep the sign gutter open at all times
let g:ale_sign_column_always = 1

" Use these options to specify what text should be used for ALE signs:
let g:ale_sign_error = 'xx'
let g:ale_sign_warning = '--'

"------------------------"
" TODO: these two pymode commands were originally grouped
"   with Syntastic configs. Find out if they are tied to
"   Syntastic, or if they are with a separate python plugin
"------------------------"
let g:pymode_lint = 1
let g:pymode_lint_on_write = 1

"------------------------"
" vim-css-color mappings
"------------------------"
let g:cssColorVimDoNotMessMyUpdatetime = 1

"------------------------"
" vim-less mappings
"------------------------"
nnoremap <Leader>m :w <BAR> !lessc % > %:t:r.css<CR><space>

"------------------------"
" Vim-instant-markdown mappings
"------------------------"
set shell=bash\ -i                      "set interactive bash as default vim shell
let g:instant_markdown_slow = 1         "only refresh on specific events
let g:instant_markdown_autostart = 0    "Autostart off to manually control launch of preview window
nnoremap <silent> <leader>im :InstantMarkdownPreview<CR>

"------------------------"
" 'Fenced' markdown syntax highlighting
"   }--> ensure syntax highlighting for 'fenced' code in Markdown files
"
"   NOT NEEDED IF TPOPE's vim-markdown plugin is installed.  All recent Vim
"   versions now include this plugin
"------------------------"
""au BufNewFile,BufReadPost *.md set filetype=markdown
au BufNewFile,BufRead *.md  setf markdown
let g:vim_markdown_fenced_languages = ['css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html']
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_folding_level = 4

"------------------------"
" vim-javascript_libraries_syntax mappings
"------------------------"
"let g:used_javascript_libs = 'jquery,lo-dash,underscore,backbone,requirejs'


