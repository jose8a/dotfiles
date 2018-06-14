"-----------------------------------"
" Mappings and Autocommands
"-----------------------------------"
" Automatically change current directory to that of the file in the buffer
autocmd BufEnter * cd %:p:h

" Map escape key to jj -- much faster
imap jj <esc>
au FocusLost * :wa              " Saves file when Vim window loses focus

" Mapping for commenting out lines in javascript or python
:autocmd FileType javascript nnoremap <buffer> <leader>cc I//<esc>
:autocmd FileType python     nnoremap <buffer> <leader>cc I#<esc>

" Automatically strip trailing spaces on Save
autocmd BufWritePre * :%s/\s\+$//e

"-----------------------------------"
" EASIER FOLDS
"-----------------------------------"
set foldmethod=syntax

nnoremap <leader>fd zd| "delete fold at the cursor - manual/marker only
nnoremap <leader>fD zD| "Delete folds at cursor recursively - manual/marker only
nnoremap <leader>fE zE| "eliminate all folds in window
nnoremap <leader>fo zo| "open fold under cursor
nnoremap <leader>fO zO| "Open all folds under cursor recursively
nnoremap <leader>fc zc| "close one fold under cursor
nnoremap <leader>fC zC| "Close all folds under cursor recursively
nnoremap <leader>ft za| "toggle one fold under cursor
nnoremap <leader>fT zA| "Toggle folds recursively under the cursor

"-----------------------------------"
" EASIER SPLITS & PANE NAVIGATION
"-----------------------------------"
" easier window navigation
nmap wh <C-W>h
nmap wj <C-W>j
nmap wk <C-W>k
nmap wl <C-W>l

" MORE NATURAL SPLIT OPENING -- Open new split panes to
" the right and bottom, which feels more natural than Vim’s default:
set splitbelow
set splitright


" Easier split resizing
:command Widen :vertical resize
:command Grow  :resize

"------------------------"
"Copy/Paste SETTINGS
"------------------------"
""" copy to clipboard
nmap cc "+
"" paste from clipboard
nmap cp "+p

