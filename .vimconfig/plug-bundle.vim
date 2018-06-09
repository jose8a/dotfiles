" ===================== .vimrc File =====================
""set term=ansi
"Don't care about compatibility with Vi.
"set nocompatible

" Environment {
    " Basics {
        set nocompatible        " must be first line
        set background=dark     " Assume a dark background
    " }
    "
    " Setup Bundle Support {
    " The next three lines ensure that the ~/.vim/bundle/ system works
        filetype off


        " ------- set rtp+=~/.vim/bundle/Vundle.vim
        " ------- call vundle#begin()
        call plug#begin('~/.vim/plugged')


    " }

" }

" Plugins {
    " Deps
        " ------- Plug 'VundleVim/Vundle.vim'

        Plug 'MarcWeber/vim-addon-mw-utils'
        Plug 'tomtom/tlib_vim'
        if executable('ack-grep')
            let g:ackprg="ack-grep -H --nocolor --nogroup --column"
            Plug 'mileszs/ack.vim'
        elseif executable('ack')
            Plug 'mileszs/ack.vim'
        elseif executable('ag')
            Plug 'mileszs/ack.vim'
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
    " Possible plugin groups:
    "   - 'general', 'completion', 'programming', 'vimcolors',
    "   - 'python', 'javascript', 'html', 'templates', 'vimux', 'misc',
    "   - 'php', 'ruby', 'scala', 'golang'
    if !exists('g:spf13_bundle_groups')
        let g:spf13_bundle_groups=['general', 'programming', 'vimcolors',
                                  \ 'completion', 'python', 'javascript',
                                  \ 'html', 'vimux', 'misc']
    endif

    " To override all the included bundles, put
    " g:override_spf13_bundles = 1
    " in your .vimrc.bundles.local file"
    if !exists("g:override_spf13_bundles")

    " General
        if count(g:spf13_bundle_groups, 'general')
            " IDE-like plugins
            Plug 'wesleyche/SrcExpl'
                "Pick one of taglist or tagbar (tagbar is newer)
            Plug 'majutsushi/tagbar'
                "Use either vim-airline or powerline
            Plug 'bling/vim-airline'
            Plug 'Lokaltog/vim-easymotion'
            Plug 'terryma/vim-multiple-cursors'
            Plug 'kien/ctrlp.vim'
            Plug 'myusuf3/numbers.vim'

            Plug 'vim-scripts/TaskList.vim'
            Plug 'samsonw/vim-task'
            Plug 'simnalamburt/vim-mundo'
            Plug 'godlygeek/tabular'
            Plug 'michaeljsmith/vim-indent-object'
            Plug 'vim-scripts/matchit.zip'
            Plug 'tpope/vim-surround'
            Plug 'spf13/vim-autoclose'
            Plug 'nathanaelkane/vim-indent-guides'
            if !exists('g:spf13_no_views')
                Plug 'vim-scripts/restore_view.vim'
            endif
        endif

    " General Programming
        if count(g:spf13_bundle_groups, 'programming')
            Plug 'w0rp/ale'
            Plug 'metakirby5/codi.vim'  " scratchpad/repl in vim buffer
            Plug 'tpope/vim-fugitive'
            Plug 'gregsexton/gitv'
            Plug 'airblade/vim-gitgutter'
            Plug 'mattn/webapi-vim'
            Plug 'mattn/gist-vim'
            Plug 'tpope/vim-dispatch'
        endif

    " Misc
        if count(g:spf13_bundle_groups, 'misc')
            Plug 'plasticboy/vim-markdown'
            Plug 'suan/vim-instant-markdown'
            Plug 'vim-pandoc/vim-pandoc'
            Plug 'vim-voom/VOoM'
            Plug 'vim-scripts/Puppet-Syntax-Highlighting'
        endif

    " Vim Colors
        if count(g:spf13_bundle_groups, 'vimcolors')
            Plug 'rking/vim-detailed'
            Plug 'altercation/vim-colors-solarized'
            Plug 'zeis/vim-kolor'
            Plug 'daylerees/colour-schemes', { 'rtp': 'vim-themes/' }
            Plug 'spf13/vim-colors'
        endif

    " Snippets & AutoComplete
        if count(g:spf13_bundle_groups, 'completion')
            " Ultisnips is the best snippet solution as of today (2018)
            " Track the engine.
            Plug 'SirVer/ultisnips'

            " Snippets are separated from the engine. Add this if you want them:
            Plug 'honza/vim-snippets'
            Plug 'Valloric/YouCompleteMe'

              " TODO: is this still needed if already using YCM
            Plug 'ervandew/supertab'
        endif

    " Python
        if count(g:spf13_bundle_groups, 'python')
            " Pick either python-mode or pyflakes & pydoc
            Plug 'python-mode/python-mode', { 'branch': 'develop' }
            "Plug 'alfredodeza/coveragepy'
            Plug 'alfredodeza/pytest'
        endif

    " Javascript
        if count(g:spf13_bundle_groups, 'javascript')
            Plug 'jelera/vim-javascript-syntax'
            Plug 'vim-scripts/JavaScript-Indent'
        endif

    " HTML/CSS
        if count(g:spf13_bundle_groups, 'html')
            Plug 'mattn/emmet-vim'
            Plug 'cakebaker/scss-syntax.vim'
            Plug 'hail2u/vim-css3-syntax'
            "Plug 'amirh/HTML-AutoCloseTag'
            Plug 'vim-scripts/HTML-AutoCloseTag'
            Plug 'othree/html5.vim'
        endif

    " Vimux
        if count(g:spf13_bundle_groups, 'vimux')
            Plug 'jpalardy/vim-slime'
            Plug 'christoomey/vim-tmux-navigator'
            Plug 'benmills/vimux'
            Plug 'tpope/vim-tbone'
            let g:slime_target = "tmux"
        endif

    " Templates
        if count(g:spf13_bundle_groups, 'templates')
            Plug 'digitaltoad/vim-pug'
                    " haml/sass/scss plugin
            Plug 'tpope/vim-haml'
            "Plug 'JulesWang/css.vim'
            "Plug 'wesQ3/vim-windowswap'
        endif

      "-----------------------------------"
      " UNUSED and OBSOLETE PLUGINS
      "   - the following file contains unused plugins
      "   - move groups of plugins from that file into
      "       this file as needed
      "-----------------------------------"
      "source ~/.vimconfig/unused-plugins.vim

    endif
" }

" --------------------------
" All Plugins must be added before this line:
" --------------------------
" ------- call vundle#end()
call plug#end()
