syntax on                       "Syntax highlighting
inoremap kj <Esc>
cnoremap kj <Esc>
set nocompatible                
set encoding=utf-8
set clipboard=unnamed
set tabstop=4
set shiftwidth=4
set expandtab
set ruler
set number relativenumber       "Relative line numbers
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set laststatus=2                "Show status bar"
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds"
vmap '' :w !pbcopy<CR><CR>

"Syntastic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol = "✗"
"let g:syntastic_check_on_wq = 0

"vundle package manager
set rtp+=~/.vim/bundle/Vundle.vim/
"filetype off
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline'
Plugin 'vim-fugitive'
Plugin 'ctrlp.vim'
Plugin 'nerdtree'
Plugin 'syntastic'
call vundle#end()
