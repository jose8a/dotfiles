"------------------------"
"" Modify the default leader-key for Emmet
"------------------------"
let g:user_emmet_leader_key='<C-E>'

"------------------------"
" Gundo mappings
"------------------------"
nnoremap <F5> :GundoToggle<CR>

"------------------------"
" vim-stringify mappings
"------------------------"
map <leader>g :call Stringify()<CR>

"------------------------"
" ctrlp mappings
"------------------------"
nmap <leader>p :CtrlP<CR>
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
let g:ctrlp_match_window = 'order:ttb,max:20'
let g:ctrlp_working_path_mode = 'ra'

let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/]\.(git|hg|svn|node_modules)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

"------------------------"
" WindowSwap mappings
"------------------------"
let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> <leader>mw :call WindowSwap#MarkWindowSwap()<CR>
nnoremap <silent> <leader>pw :call WindowSwap#DoWindowSwap()<CR>

"------------------------"
" Tagbar mappings
"------------------------"
nnoremap <silent> <F9> :TagbarToggle<CR>
nnoremap <silent> <leader>tb :TagbarToggle<CR>

"------------------------"
" Vim-task mappings
"------------------------"
inoremap <silent> <buffer> <leader>tk <ESC>:call Toggle_task_status()<CR>i
noremap <silent> <buffer> <leader>tk :call Toggle_task_status()<CR>


