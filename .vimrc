" This script contains all config for Plugins
source ~/.vimconfig/plug-bundle.vim

" --------------------------
"  required by vim-textobj
" --------------------------
:runtime macros/matchit.vim

" ---------------------------
" Enable syntax highlighting & validation
" ---------------------------
syntax on

" enables filetype detection
filetype on

" required by Vundle! & enable loading the plugin
"   indent file for filetype
filetype plugin on
filetype indent on

"Switch between buffers without saving
set hidden

"-----------------------------------"
" General SETTINGS
"-----------------------------------"
source ~/.vimconfig/settings-general.vim

"-----------------------------------"
" Mappings and Autocommands
"-----------------------------------"
source ~/.vimconfig/mappings-general.vim

"------------------------"
"FileType Plugins SETTINGS
"------------------------"
source ~/.vimconfig/settings-ftplugins.vim

"------------------------"
"Other Plugins SETTINGS
"------------------------"
source ~/.vimconfig/settings-plugins.vim

"------------------------"
" Outdated Configs (usually all disabled)
"------------------------"
" DO NOT IMPORT THESE SETTINGS IF POSSIBLE
""source ~/.vimconfig/outdated-configs.vim

