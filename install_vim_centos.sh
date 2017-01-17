#!/bin/bash

yum -y install vim git
git clone https://github.com/ammario/dotfiles /tmp/dotfiles
cp /tmp/dotfiles/.vimrc ~/.vimrc
mkdir ~/.vim/colors
cp -r /tmp/dotfiles/colors/* ~/.vim/colors
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

