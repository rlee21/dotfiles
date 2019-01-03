#!/bin/bash

set -e

# download vim plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim;
git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline;
git clone https://github.com/vim-airline/vim-airline-themes ~/.vim/bundle/vim-airline-themes;
git clone https://github.com/kien/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim;
git clone https://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive;
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree;
git clone --depth=1 https://github.com/vim-syntastic/syntastic.git ~/.vim/bundle/syntastic;
git clone https://github.com/tpope/vim-commentary.git ~/.vim/bundle/vim-commentary;
git clone https://tpope.io/vim/surround.git ~/.vim/bundle/surround;
git clone https://github.com/vim-ruby/vim-ruby.git ~/.vim/bundle/vim-ruby;
git clone https://github.com/tpope/vim-rails.git ~/.vim/bundle/vim-rails;



# notes to install plugins using vundle
# 1) download vim plugin using git clone
# 2) add new plugin to ~/.vimrc
# 3) :source % <tab> <enter>
# 4) :PluginInstall

# note: :PluginClean to remove any unused plugins
