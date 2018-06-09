    " Ruby
        if count(g:spf13_bundle_groups, 'ruby')
            Plug 'tpope/vim-rails'
            Plug 'tpope/vim-rvm'
            Plug 'vim-scripts/simplefold'
            Plug 'vim-ruby/vim-ruby'
            Plug 'tpope/vim-endwise'
            Plug 'thoughtbot/vim-rspec'
            Plug 'tpope/vim-cucumber'
            Plug 'quentindecock/vim-cucumber-align-pipes'
            Plug 'nelstrom/vim-textobj-rubyblock'

            " the following lines are needed for ruby code completion, and also
            " make sure that the 'supertab' plugin is installed, otherwise tab-completion won't work
            autocmd FileType ruby set omnifunc=rubycomplete#Complete
            autocmd FileType ruby let g:rubycomplete_buffer_loading = 1
            autocmd FileType ruby let g:rubycomplete_rails = 1
            autocmd FileType ruby let g:rubycomplete_classes_in_global = 1
            "let g:rubycomplete_rails = 1
        endif

    " Java
        if count(g:spf13_bundle_groups, 'scala')
            Plug 'derekwyatt/vim-scala'
            Plug 'derekwyatt/vim-sbt'
        endif

    " GoLang
        if count(g:spf13_bundle_groups, 'golang')
            Plug 'fatih/vim-go'
        endif

    " PHP
        if count(g:spf13_bundle_groups, 'php')
            Plug 'spf13/PIV'
            Plug 'beyondwords/vim-twig'   "Template engine for PHP
        endif

    " Obsolete Plugs
        if count(g:spf13_bundle_groups, 'obsolete-plugins')
            " ----------------------------------- "
            "  GENERAL plugins
            "Plug 'fholgado/minibufexpl.vim'
            "Plug 'mhinz/vim-startify'
            "Plug 'basepi/vim-conque'
            "Plug 'scrooloose/nerdtree'
            "Plug 'jistr/vim-nerdtree-tabs'
            "Plug 'vim-scripts/taglist.vim'
            "Plug 'Lokaltog/powerline'
            "Plug 'scrooloose/nerdcommenter'
            "Plug 'vim-scripts/sessionman.vim'
            "Plug 'tpope/vim-obsession'
            "Plug 'mbbill/undotree'
            "Plug 'sjl/gundo.vim'
            "Plug 'tpope/vim-abolish.git'
            "Plug 'kana/vim-textobj-user'

            " ----------------------------------- "
            "  PROGRAMMING plugins
            " -- Pick one of the checksyntax, jslint, or syntastic
            "Plug 'scrooloose/syntastic'
            " -- checksyntax-B appears to be same as checksyntax_vim, use only one
            "Plug 'vim-scripts/checksyntax-B'
            "Plug 'tomtom/checksyntax_vim'

            " ----------------------------------- "
            "  JAVASCRIPT plugins
            "Plug 'leshill/vim-json'
            "Plug 'pangloss/vim-javascript'
            "Plug 'briancollins/vim-jst'
            "Plug 'kchmck/vim-coffee-script'
            "Plug 'othree/javascript-libraries-syntax.vim'
            "Plug 'posva/vim-vue'
            "Plug 'tao12345666333/vim-vue'
            "Plug 'wookiehangover/jshint.vim'
            "Plug '29decibel/vim-stringify'
            "Plug 'myhere/vim-nodejs-complete'
            "Plug 'sidorares/node-vim-debugger'
            "Plug 'moll/vim-node'
            "Plug 'guileen/vim-node'
            "Plug 'ahayman/vim-nodejs-complete'
            "Plug 'mklabs/vim-backbone'

            " ----------------------------------- "
            "  PYTHON plugins
            "Plug 'klen/python-mode'
            "Plug 'python.vim'
            "Plug 'python_match.vim'
            "Plug 'python-rope/ropevim'
            "Plug 'pythoncomplete'

            " ----------------------------------- "
            "  HTCSS plugins
                    "Loads only when editing less files
            "Plug 'groenewege/vim-less', { 'for' : ['less'] }
            "Plug 'skammer/vim-css-color'  "color preview in CSS files

            " ----------------------------------- "
            "  MARKUP plugins
            "Plug 'spf13/vim-preview'    " preview for md/html/etc ... SLOW STARTUP

            " ----------------------------------- "
            "  VIMUX plugins
            "Plug 'julienr/vimux-pyutils'
            "Plug 'pgr0ss/vimux-ruby-test'
            "Plug 'cloud8421/vimux-cucumber'

            " ----------------------------------- "
            "  MISC plugins
            "Plug 'sheerun/vim-polyglot'
            "Plug 'joonty/vdebug'
            "Plug 'tpope/vim-markdown'
            "Plug 'nelstrom/vim-markdown-folding'
            "Plug 'mzlogin/vim-markdown-toc'

            " ----------------------------------- "
            "  COLORS plugins
            "Plug 'noah/vim256-color'
            "Plug 'subosito/vim-256colors'
            "Plug 'flazz/vim-colorschemes'
            "Plug 'godlygeek/csapprox'
        endif

