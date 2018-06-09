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
" MISCELLANEOUS SETTINGS
"-----------------------------------"
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

set autowrite                   " Write the old file out when switching between files.
set ruler                       " Display current cursor position in lower right corner.
let mapleader = ","             " Want a different map leader than \
let maplocalleader = "\\"      " Map a local filetype leader to '\'
set timeoutlen=400              " Ever notice a slight lag after typing the leader key + command? This lowers
                                " the timeout.
set hidden                      " Switch between buffers without saving

set backupdir=~/.vim/tmp/backup//   " Set Backups directory
set directory=~/.vim/tmp/swap//     " Set Swap files directory
set backup                          " Enable backups
"set nobackup                       " Disable backups
"set noswapfile                     " Disable swapfiles

" 2017.0209 after a MacOSX crash, all files open in RO only mode.  Need to disble RO mode until find cause.
set noro                        " globally set no-readonly mode on all files

set hlsearch                    " highlight on search
set showmatch                   " Show matching brackets
""set foldenable                  " Enable code folding
set visualbell                  " Set bell to visual rather than to a sound
set showcmd                     " Show command in bottom right portion of the screen
set number                      " Show lines numbers
"set relativenumber             " Prefer relative line numbering?
set laststatus=2                " Always show the status line
set linespace=3                 " Prefer a slightly higher line height
set backspace=indent,eol,start

set wrap                        " Better line wrapping
set textwidth=79                " Better line wrapping (2)
set formatoptions=qrn1          " Better line wrapping (3)
nnoremap <leader>q gqip         " Hard-wrap paragraphs of text

set mousehide                   " Hide mouse when typing

                                " Session settings
set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help

let g:enable_numbers = 0        " Numbers.vim turn off automatic number switching

set pastetoggle=<leader>pt      " Prevents nasty side-effects when pasting large chunks of text/code

"-----------------------------------"
" Folding
"-----------------------------------"
"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=7         "this is just what i use"


