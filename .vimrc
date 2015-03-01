" ===================== .vimrc File =====================
""set term=ansi
"Don't care about compatibility with Vi.
set nocompatible

" Environment {
    " Basics {
        set nocompatible        " must be first line
        set background=dark     " Assume a dark background
    " }
    "
    " Setup Bundle Support {
    " The next three lines ensure that the ~/.vim/bundle/ system works
        filetype off
        set rtp+=~/.vim/bundle/Vundle.vim
        call vundle#begin()
    " }

" }

" Plugins {
    " Deps
        Plugin 'gmarik/Vundle.vim'
        Plugin 'MarcWeber/vim-addon-mw-utils'
        Plugin 'tomtom/tlib_vim'
        if executable('ack-grep')
            let g:ackprg="ack-grep -H --nocolor --nogroup --column"
            Plugin 'mileszs/ack.vim'
        elseif executable('ack')
            Plugin 'mileszs/ack.vim'
        elseif executable('ag')
            Plugin 'mileszs/ack.vim'
            let g:ackprg = 'ag --nogroup --nocolor --column'
        endif

    " Use local bundles if available {
        if filereadable(expand("~/.vimrc.bundles.local"))
            source ~/.vimrc.bundles.local
        endif
    " }
    " Use fork bundles if available {
        if filereadable(expand("~/.vimrc.bundles.fork"))
            source ~/.vimrc.bundles.fork
        endif
    " }

    " In your .vimrc.bundles.local file"
    " list only the plugin groups you will use
    if !exists('g:spf13_bundle_groups')
        "let g:spf13_bundle_groups=['general', 'neocomplcache', 'programming', 'vimcolors', 'php', 'ruby', 'python', 'javascript', 'html', 'vimux', 'misc', 'scala']
        let g:spf13_bundle_groups=['general', 'programming', 'vimcolors', 'snipmate', 'ruby', 'python', 'javascript', 'html', 'vimux', 'misc']
    endif

    " To override all the included bundles, put
    " g:override_spf13_bundles = 1
    " in your .vimrc.bundles.local file"
    if !exists("g:override_spf13_bundles")

    " General
        if count(g:spf13_bundle_groups, 'general')
            Plugin 'scrooloose/nerdtree'
            Plugin 'wesleyche/SrcExpl'
            " Pick one of taglist or tagbar (tagbar is newer)
            "Plugin 'vim-scripts/taglist.vim'
            Plugin 'fholgado/minibufexpl.vim'
            Plugin 'tpope/vim-surround'
            Plugin 'tpope/vim-obsession'
            Plugin 'tpope/vim-tbone'
            Plugin 'spf13/vim-autoclose'
            Plugin 'kien/ctrlp.vim'
            Plugin 'vim-scripts/sessionman.vim'
            Plugin 'matchit.zip'
            Plugin 'kana/vim-textobj-user'
            Plugin 'michaeljsmith/vim-indent-object'
            Plugin 'nelstrom/vim-textobj-rubyblock'
                    "Use either vim-airline or powerline
            Plugin 'bling/vim-airline'
            ""Plugin 'Lokaltog/powerline'
            Plugin 'Lokaltog/vim-easymotion'
            Plugin 'jistr/vim-nerdtree-tabs'
            Plugin 'mbbill/undotree'
            Plugin 'myusuf3/numbers.vim'
            Plugin 'nathanaelkane/vim-indent-guides'
            Plugin 'vim-scripts/TaskList.vim'
            Plugin 'mhinz/vim-startify'
            if !exists('g:spf13_no_views')
                Plugin 'vim-scripts/restore_view.vim'
            endif
            Plugin 'tpope/vim-abolish.git'
            Plugin 'sjl/gundo.vim'
            Plugin 'wesQ3/vim-windowswap'
            Plugin 'samsonw/vim-task'
            Plugin 'basepi/vim-conque'
            Plugin 'terryma/vim-multiple-cursors'
        endif

    " General Programming
        if count(g:spf13_bundle_groups, 'programming')
            " Pick one of the checksyntax, jslint, or syntastic
            Plugin 'scrooloose/syntastic'
            " checksyntax-B appears to be same as checksyntax_vim, use only one
            "Plugin 'vim-scripts/checksyntax-B'
            "Plugin 'tomtom/checksyntax_vim'
            Plugin 'tpope/vim-fugitive'
            Plugin 'gregsexton/gitv'
            Plugin 'airblade/vim-gitgutter'
            Plugin 'mattn/webapi-vim'
            Plugin 'mattn/gist-vim'
            Plugin 'scrooloose/nerdcommenter'
            Plugin 'godlygeek/tabular'
            Plugin 'ervandew/supertab'
            Plugin 'tpope/vim-dispatch'
            Plugin 'majutsushi/tagbar'
            ""if executable('ctags')
            ""    Plugin 'majutsushi/tagbar'
            ""endif
        endif

    " Misc
        if count(g:spf13_bundle_groups, 'misc')
            ""Plugin 'sheerun/vim-polyglot'
            ""Plugin 'joonty/vdebug'
            Plugin 'thoughtbot/vim-rspec'
            Plugin 'suan/vim-instant-markdown'
            ""Plugin 'tpope/vim-markdown'
            Plugin 'vim-pandoc/vim-pandoc'
            Plugin 'vim-voom/VOoM'
            Plugin 'spf13/vim-preview'
            Plugin 'tpope/vim-cucumber'
            Plugin 'quentindecock/vim-cucumber-align-pipes'
            Plugin 'Puppet-Syntax-Highlighting'
        endif

    " Vim Colors
        if count(g:spf13_bundle_groups, 'vimcolors')
            Plugin 'rking/vim-detailed'
            Plugin 'altercation/vim-colors-solarized'
            Plugin 'zeis/vim-kolor'
            Plugin 'daylerees/colour-schemes', { 'rtp': 'vim-themes/' }
            "Plugin 'noah/vim256-color'
            ""Plugin 'subosito/vim-256colors'
            "Plugin 'flazz/vim-colorschemes'
            "Plugin 'godlygeek/csapprox'
            Plugin 'spf13/vim-colors'
        endif

    " Snippets & AutoComplete
        if count(g:spf13_bundle_groups, 'snipmate')
            Plugin 'garbas/vim-snipmate'
            Plugin 'honza/vim-snippets'
            ""Plugin 'Valloric/YouCompleteMe'
            ""Plugin 'marijnh/tern_for_vim'
            ""Plugin 'scrooloose/snipmate-snippets'
           " Source support_function.vim to support snipmate-snippets.
            if filereadable(expand("~/.vim/bundle/snipmate-snippets/snippets/support_functions.vim"))
                source ~/.vim/bundle/snipmate-snippets/snippets/support_functions.vim
            endif
        elseif count(g:spf13_bundle_groups, 'neocomplcache')
            Plugin 'Shougo/neocomplcache'
            Plugin 'Shougo/neosnippet'
            Plugin 'honza/snipmate-snippets'
            Plugin 'jamescarr/snipmate-nodejs'
        endif

    " Python
        if count(g:spf13_bundle_groups, 'python')
            " Pick either python-mode or pyflakes & pydoc
            Plugin 'klen/python-mode'
            Plugin 'python.vim'
            Plugin 'python_match.vim'
            Plugin 'pythoncomplete'
        endif

    " Ruby
        if count(g:spf13_bundle_groups, 'ruby')
            Plugin 'tpope/vim-rails'
            Plugin 'tpope/vim-rvm'
            Plugin 'vim-scripts/simplefold'
            Plugin 'vim-ruby/vim-ruby'
            Plugin 'tpope/vim-endwise'
            " the following lines are needed for ruby code completion, and also
            " make sure that the 'supertab' plugin is installed, otherwise tab-completion won't work
            autocmd FileType ruby set omnifunc=rubycomplete#Complete
            autocmd FileType ruby let g:rubycomplete_buffer_loading = 1
            autocmd FileType ruby let g:rubycomplete_rails = 1
            autocmd FileType ruby let g:rubycomplete_classes_in_global = 1
            "let g:rubycomplete_rails = 1
        endif

    " Javascript
        if count(g:spf13_bundle_groups, 'javascript')
            ""Plugin 'leshill/vim-json'
            ""Plugin 'groenewege/vim-less'
            ""Plugin 'pangloss/vim-javascript'
            ""Plugin 'briancollins/vim-jst'
            ""Plugin 'kchmck/vim-coffee-script'
            Plugin 'jelera/vim-javascript-syntax'
            Plugin 'vim-scripts/JavaScript-Indent'
            Plugin 'othree/javascript-libraries-syntax.vim'
            Plugin 'mklabs/vim-backbone'
            ""Plugin 'wookiehangover/jshint.vim'
            ""Plugin '29decibel/vim-stringify'
            ""Plugin 'digitaltoad/vim-jade'
            ""Plugin 'myhere/vim-nodejs-complete'
            ""Plugin 'sidorares/node-vim-debugger'
            ""Plugin 'moll/vim-node'
            ""Plugin 'guileen/vim-node'
            ""Plugin 'ahayman/vim-nodejs-complete'
        endif

    " Java
        if count(g:spf13_bundle_groups, 'scala')
            Plugin 'derekwyatt/vim-scala'
            Plugin 'derekwyatt/vim-sbt'
        endif

    " HTML
        if count(g:spf13_bundle_groups, 'html')
            Plugin 'mattn/emmet-vim'
            Plugin 'amirh/HTML-AutoCloseTag'
            " Plugin 'hail2u/vim-css3-syntax'
            Plugin 'JulesWang/css.vim'
            Plugin 'cakebaker/scss-syntax.vim'
            Plugin 'skammer/vim-css-color'
            Plugin 'groenewege/vim-less'
                    " haml/sass/scss plugin
            Plugin 'tpope/vim-haml'     
        endif

    " Vimux
        if count(g:spf13_bundle_groups, 'vimux')
            Plugin 'jpalardy/vim-slime'
            Plugin 'christoomey/vim-tmux-navigator'
            Plugin 'benmills/vimux'
            "Plugin 'julienr/vimux-pyutils'
            "Plugin 'pgr0ss/vimux-ruby-test'
            "Plugin 'cloud8421/vimux-cucumber'
            let g:slime_target = "tmux"
        endif

    " PHP
        if count(g:spf13_bundle_groups, 'php')
            Plugin 'spf13/PIV'
        endif

    " Twig
        if count(g:spf13_bundle_groups, 'twig')
            Plugin 'beyondwords/vim-twig'
        endif
    endif
" }

" --------------------------
" All Vundle Plugins must be added before the following line:
" --------------------------
call vundle#end()

" --------------------------
"  required by vim-textobj
" --------------------------
:runtime macros/matchit.vim 

" ---------------------------
" Enable syntax highlighting & validation
" ---------------------------
syntax on
filetype on                     " enables filetype detection
filetype plugin on          " required by Vundle! & enable loading plugin indent file for filetype
filetype indent on          " required by Vundle! & enable loading plugin indent file for filetype


"Switch between buffers without saving
set hidden

"-----------------------------------"
" COLOR SETTINGS 
"-----------------------------------"
"Set to 256 colors before setting colorscheme
set t_Co=256

" SOLARIZED COLOR BELOW
" The next few lines are setting for the solarized colorscheme.
" See more at: https://github.com/altercation/vim-colors-solarized
"syntax enable
" 
" for dark background using solarized:
set background=dark
" or, for the light background mode of Solarized:
"set background=light
" 
" Uncomment this next line if you are forcing terminal color mode to 256 colors
"let g:solarized_termcolors=256
"let g:solarized_termtrans=0
""let g:solarized_contrast="high"         "normal, high, low are available settings here
""let g:solarized_degrade=1               "forces solarized to degrade colors if needed
" Finally, set the solarized color:
"colorscheme solarized


"let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
"Set the color scheme. Change this to your preference.
"Here's 100 to choose from: http://www.vim.o
"======= Uncomment the desired default colorscheme ======
"colorscheme af              "YES"
"colorscheme borland"
"colorscheme charged-256    "YES"
"colorscheme colorful256    "YES"
"colorscheme delek "
"colorscheme desert         "YES"
"colorscheme desert256       "YES"
"colorscheme detailed       "1 - YES"
"colorscheme devbox-dark-256
"colorscheme jellybeans     "YES"
colorscheme kolor           "1 - YES"
"colorscheme kruby "
"colorscheme molokai "
"colorscheme mrkn256
"colorscheme scite "
"colorscheme settlemyer     "MAYBE"
"colorscheme sienna
"colorscheme simple256      "YES"
"colorscheme slate          "YES"
"colorscheme spring         "YES"
"colorscheme tidy "
"colorscheme trivial256
"colorscheme vibrantink     "1 - YES"
"colorscheme xoria256       "YES"
"--------- Next Tier"
"colorscheme autumn
"colorscheme lucius         "MAYBE"
"colorscheme candy          "MAYBE"
"colorscheme github         "MAYBE"


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


"-----------------------------------"
" Folding
"-----------------------------------"
"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use"


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

"-----------------------------------"
" EASIER SPLITS & PANE NAVIGATION
"-----------------------------------"
        " easier window navigation
nmap wh <C-W>h
nmap wj <C-W>j
nmap wk <C-W>k
nmap wl <C-W>l

        " easier screen-up/screen-down movement
nmap ff <C-f>
nmap bb <C-b>
"nmap bb 75k
        " remap 1/2-screen-down movement
nmap ww <C-D>
        " remap 1/2-screen-up movement
nmap uu <C-U>

set splitbelow              " MORE NATURAL SPLIT OPENING -- Open new split panes to
set splitright              " the right and bottom, which feels more natural than Vim’s default:

" Shortcut to opening a virtual split to right of current pane
" Makes more sense than opening to the left
nmap <leader>bv :bel vsp
" Opens a vertical split and switches over (\v)
nnoremap <leader>v <C-w>v<C-w>l

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


"------------------------"
"NERDTREE PLUGIN SETTINGS
"------------------------"
"Shortcut for NERDTreeToggle
map <F2> :NERDTreeToggle<CR>
nmap <leader>nt :NERDTreeToggle <CR>
nmap <leader>fn :NERDTreeFind<CR>

"Show hidden files in NerdTree
let NERDTreeShowHidden=1

"autopen NERDTree and focus cursor in new document
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

"------------------------"
"TAGBAR PLUGIN SETTINGS
"------------------------"
nmap <F8> :TagbarToggle<CR>

"------------------------"
" vim-rspec mappings
"------------------------"
nnoremap <Leader>fs :call RunCurrentSpecFile()<CR>
nnoremap <Leader>ns :call RunNearestSpec()<CR>
nnoremap <Leader>ls :call RunLastSpec()<CR>"

"------------------------"
" vim-css-color mappings
"------------------------"
let g:cssColorVimDoNotMessMyUpdatetime = 1

"------------------------"
" vim-less mappings
"------------------------"
nnoremap <Leader>m :w <BAR> !lessc % > %:t:r.css<CR><space>

"------------------------"
" syntastic mappings
"------------------------"
" On by default, turn it off for html
let g:syntastic_mode_map = { 'mode': 'active',
  \ 'active_filetypes': [],
  \ 'passive_filetypes': ['html'] }

" This does what it says on the tin. It will check your file on open too, not
" just on save.
" " You might not want this, so just leave it out if you don't.
let g:syntastic_check_on_open=1

" Better :sign interface symbols
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'"

" Use jshint (uses ~/.jshintrc)
""let g:syntastic_javascript_checkers = ['jshint']

" Make sure jsonlint is installed ==> 'which jsonlint'
" If not, then run 'npm install -g jsonlint'
" Tell Syntastic to use jsonlint to check json files"
let g:syntastic_json_checkers=['jsonlint']

" Ensure json files set to the right type automatically"
au BufRead,BufNewFile *.json set filetype=json

"------------------------"
" vim-javascript_libraries_syntax mappings
"------------------------"
let g:used_javascript_libs = 'jquery,lo-dash,underscore,backbone,requirejs'

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

"------------------------"
" Vim-instant-markdown mappings
"------------------------"
set shell=bash\ -i                      "set interactive bash as default vim shell
let g:instant_markdown_slow = 1         "only refresh on specific events
let g:instant_markdown_autostart = 0    "Autostart off to manually control launch of preview window
nnoremap <silent> <leader>im :InstantMarkdownPreview<CR>

"------------------------"
" Vim-pandoc non-standard mappings
"------------------------"
""By default, vim-pandoc provides some handy executors:
  ""PandocPdf (<localleader>pdf), which runs pandoc, passing the value of g:pandoc_bibfile 
    ""as the argument of --bibliography.
  ""PandocPdfOpen (pdf+), same as above, but opens the pdf using your default pdf viewer.
  ""PandocHtml (<localleader>html), which creates a standalone html.
  ""PandocHtmlOpen (html+), same as above, but opens the html file in your default browser.
  ""PandocOdt (<localleader>odt), which creates an ODT file, passing the value of 
    "g:pandoc_bibfile as the argument of --bibliography.
  ""PandocOdtOpen (<localleader>odt+), same as above, but opens the ODT in your default ODT viewer.

"------------------------"
" Vimux-ruby-test mappings
"------------------------"
"Use any of the commands below. Map them to shortcuts in your .vimrc for easy
"access.
"
"RunRubyFocusedTest - run focused test/spec
"RunRailsFocusedTest - run focused test (no spec support) in a Rails app
"RunRubyFocusedContext - run current context (rspec, shoulda)
"RunAllRubyTests - run all the tests/specs in the current file


"------------------------"
" Vimux-cucumber mappings
"------------------------"
"Use any of the commands below. Map them to shortcuts in your .vimrc for easy
"access.
"
"RunFocusedCuke - run focused cuke
"RunAllCukes - run all cukes in the current file
"IMPORTANT: if you use this plugin and Vimux-Ruby-Test, you may want to share
"the same shortcut. If you do, you can use the following configuration:
"
" if exists('$TMUX')
"   autocmd FileType ruby map <buffer> <Leader>f :RunRubyFocusedTest<CR>
"   autocmd FileType ruby map <buffer> <Leader>t :RunAllRubyTests<CR>
"   autocmd FileType cucumber map <Leader>f :RunFocusedCuke<CR>
"   autocmd FileType cucumber map <Leader>t :RunAllCukes<CR>
" endif
"        
" *** This assumes that your Vim configuration recognizes Cucumber features
"     with the cucumber file type.


