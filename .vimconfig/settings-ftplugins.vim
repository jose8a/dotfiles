"-----------------------------------"
" Ack mappings
"-----------------------------------"
nnoremap <leader>ak :Ack!<space>

"-----------------------------------"
" Fugitive mappings
"-----------------------------------"
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>ga :Gadd<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gco :Gcheckout<cr>
nnoremap <leader>gci :Gcommit<cr>
nnoremap <leader>gm :Gmove<cr>
nnoremap <leader>gr :Gremove<cr>
nnoremap <leader>gl :Shell git gl -18<cr>:wincmd \|<cr>

augroup ft_fugitive
    au!

    au BufNewFile,BufRead .git/index setlocal nolist
augroup END

"gitHub
nnoremap <leader>H :Gbrowse<cr>
vnoremap <leader>H :Gbrowse<cr>


"-----------------------------------"
" ALE Linter configs
"-----------------------------------"
let g:ale_linters = {
\   'javascript': ['eslint'],
\}

let g:ale_completion_enabled = 1

" keep the sign gutter open at all times
let g:ale_sign_column_always = 1

" Use these options to specify what text should be used for ALE signs:
let g:ale_sign_error = 'xx'
let g:ale_sign_warning = '--'

" Turn on python code-linting, and
" check code on every save - if modified
let g:pymode_lint = 1
let g:pymode_lint_on_write = 1


"-----------------------------------"
" vim-css-color mappings
"-----------------------------------"
let g:cssColorVimDoNotMessMyUpdatetime = 1


"-----------------------------------"
" 'Fenced' markdown syntax highlighting
"   }--> ensure syntax highlighting for 'fenced' code in Markdown files
"
"   NOT NEEDED IF TPOPE's vim-markdown plugin is installed.  All recent Vim
"   versions now include this plugin
"-----------------------------------"
let g:vim_markdown_fenced_languages = ['css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html']
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_folding_level = 4


