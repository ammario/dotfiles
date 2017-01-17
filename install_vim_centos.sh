#!/bin/bash

yum -y install vim git
cd /tmp
git clone https://github.com/ammario/dotfiles
cp dotfiles/.vimrc ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

