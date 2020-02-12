"-----------------------------------"
" INDENT SETTINGS
"-----------------------------------"
set autoindent
set smartindent
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
                    " Display tabs and trailing spaces visually:
set list listchars=tab:\ \ ,trail:·


"-----------------------------------"
" Ultisnips Trigger configuration. Do not use <tab> if you use:
"   - https://github.com/Valloric/YouCompleteMe.
"-----------------------------------"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


"-----------------------------------"
" WILDMENU SETTINGS
" - wild menu is the menu-completion in command-mode pane
"-----------------------------------"
set wildmenu
set wildmode=list:longest

set wildignore+=*/tmp/*,*.so,*.swp,*.zip         " MacOSX/Linux
set wildignore+=*.DS_Store                       " More OSX
set wildignore+=.git.svn                         " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files


"-----------------------------------"
" MISCELLANEOUS SETTINGS
"-----------------------------------"
set autowrite                       " Write the old file out when switching between files.
set ruler                           " Display current cursor position in lower right corner.
let mapleader = ","                 " Want a different map leader than \
let maplocalleader = "\\"           " Map a local filetype leader to '\'
set timeoutlen=400                  " Ever notice a slight lag after typing the leader key + command? This lowers
                                    " the timeout.
set hidden                          " Switch between buffers without saving

set backupdir=~/.vim/tmp/backup//   " Set Backups directory
set directory=~/.vim/tmp/swap//     " Set Swap files directory
set backup                          " Enable backups
"set nobackup                       " Disable backups
"set noswapfile                     " Disable swapfiles

" 2017.0209 after a MacOSX crash, all files open in RO only mode.  Need to disble RO mode until find cause.
set noro                            " globally set no-readonly mode on all files

set hlsearch                        " highlight on search
set showmatch                       " Show matching brackets
set visualbell                      " Set bell to visual rather than to a sound
set showcmd                         " Show command in bottom right portion of the screen
set number                          " Show lines numbers
"set relativenumber                 " Prefer relative line numbering?
set laststatus=2                    " Always show the status line
set linespace=3                     " Prefer a slightly higher line height
set backspace=indent,eol,start

set wrap                            " Better line wrapping
set textwidth=79                    " Better line wrapping (2)
set formatoptions=qrn1              " Better line wrapping (3)
nnoremap <leader>q gqip             " Hard-wrap paragraphs of text

set mousehide                       " Hide mouse when typing

                                    " Session settings
set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help

let g:enable_numbers = 0            " Numbers.vim turn off automatic number switching

set pastetoggle=<leader>pt          " Prevents nasty side-effects when pasting large chunks of text/code


"-----------------------------------"
" Simple StatusLine
"-----------------------------------"
set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]


"-----------------------------------"
" COLOR SETTINGS
"-----------------------------------"
"Set to 256 colors before setting colorscheme
" TODO??: this setting may no longer be needed in modern VIM
set t_Co=256

colorscheme kolor

