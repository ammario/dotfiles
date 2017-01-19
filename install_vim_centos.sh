#!/bin/bash

#Install deps
yum -y install gcc git ncurses-devel

#Install Vim
git clone https://github.com/vim/vim /tmp/vim
cd /tmp/vim
./configure
make
make install
ln  -s /usr/local/bin/vim /usr/bin/vim

#Install dotfiles
git clone https://github.com/ammario/dotfiles /tmp/dotfiles
cp /tmp/dotfiles/.vimrc ~/.vimrc
mkdir -p ~/.vim/colors
cp -r /tmp/dotfiles/colors/* ~/.vim/colors
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

