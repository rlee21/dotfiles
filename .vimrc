set nocompatible                
set number                      "Line numbers
syntax on                       "Syntax highlighting
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set expandtab
set ruler
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set laststatus=2                "Show status bar"
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds"
inoremap kj <Esc>
cnoremap kj <Esc>

"vundle package manager
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline'
Plugin 'vim-fugitive'
Plugin 'ctrlp.vim'
call vundle#end()
