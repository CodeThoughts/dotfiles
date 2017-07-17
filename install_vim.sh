#!/bin/bash

#copy configs
cp ./.vimrc ~/.vimrc

#install plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim 2>/dev/null
vim +PluginInstall +qall

