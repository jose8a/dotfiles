"-----------------------------------"
" Mappings and Autocommands
"-----------------------------------"
                                " Set up an HTML5 template for all new .html files
"autocmd BufNewFile * silent! 0r $VIMHOME/templates/%:e.tpl

                                " Automatically change current directory to that of the file in the buffer
autocmd BufEnter * cd %:p:h

nnoremap <leader>ft Vatzf       " Shortcut to fold tags with leader (usually \) + ft

        " Map escape key to jj -- much faster
imap jj <esc>
au FocusLost * :wa              " Saves file when Vim window loses focus

" automation of ruby syntax check with rr
autocmd FileType ruby nmap rr :w<SPACE>!ruby -c %<CR>

" Mapping for commenting out lines in javascript or python
:autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
:autocmd FileType python     nnoremap <buffer> <localleader>c I#<esc>

" Automatically strip trailing spaces on Save
autocmd BufWritePre * :%s/\s\+$//e

"-----------------------------------"
" EASIER SPLITS & PANE NAVIGATION
"-----------------------------------"
        " easier window navigation
nmap wh <C-W>h
nmap wj <C-W>j
nmap wk <C-W>k
nmap wl <C-W>l

        " close the current pane
nmap pc <C-W>q

        " easier screen-up/screen-down movement
nmap ff <C-f>
nmap bb <C-b>
"nmap bb 75k
        " remap 1/2-screen-down movement
nmap fh <C-D>
        " remap 1/2-screen-up movement
nmap bh <C-U>

set splitbelow              " MORE NATURAL SPLIT OPENING -- Open new split panes to
set splitright              " the right and bottom, which feels more natural than Vim’s default:

" Shortcut to opening a virtual split to right of current pane
" Makes more sense than opening to the left
""nmap <leader>bv :bel vsp

" Opens a vertical split and switches over (\v)
""nnoremap <leader>v <C-w>v<C-w>l

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

