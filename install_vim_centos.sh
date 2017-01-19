#!/bin/bash

sudo su

#Install deps

yum -y install gcc git ncurses-devel lua lua-devel
yum -y install ruby ruby-devel
yum -y install python python-devel


#Install Vim
git clone https://github.com/vim/vim /tmp/vim
cd /tmp/vim
./configure  --disable-selinux \
	--enable-luainterp \
	--enable-pythoninterp \
	--enable-python3interp \
	--enable-tclinterp \
	--enable-rubyinterp \
	--enable-multibyte \
	--disable-gui \
	--with-features=huge 

make && make install
ln  -s /usr/local/bin/vim /usr/bin/vim

exit #exit sudo

#Install dotfiles
git clone https://github.com/ammario/dotfiles /tmp/dotfiles
cp /tmp/dotfiles/.vimrc ~/.vimrc
mkdir -p ~/.vim/colors
cp -r /tmp/dotfiles/colors/* ~/.vim/colors
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

