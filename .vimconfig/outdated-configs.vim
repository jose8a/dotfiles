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
"

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
""autocmd VimEnter * NERDTree
""autocmd VimEnter * wincmd p


"------------------------"
" vim-rspec mappings
"------------------------"
nnoremap <Leader>fs :call RunCurrentSpecFile()<CR>
nnoremap <Leader>ns :call RunNearestSpec()<CR>
nnoremap <Leader>ls :call RunLastSpec()<CR>"


