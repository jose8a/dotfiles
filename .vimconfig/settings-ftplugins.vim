"------------------------"
"FileType SETTINGS
"------------------------"
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

" Turn on python code-linting, and
" check code on every save - if modified
let g:pymode_lint = 1
let g:pymode_lint_on_write = 1

"------------------------"
" vim-css-color mappings
"------------------------"
let g:cssColorVimDoNotMessMyUpdatetime = 1

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


