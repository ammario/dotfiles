#!/bin/bash
# Binaries and scripts
cp ~/bin/lsws bin/

# Configs
cp ~/.gitconfig .gitconfig
cp -r ~/.fonts .
cp -r ~/.vimrc .vimrc
cp -r ~/.vim .
cp -r ~/.config/Code/User/snippets/ .config/Code/User
cp -r ~/.config/Code/User/keybindings.json .config/Code/User
cp -r ~/.config/Code/User/settings.json .config/Code/User
cp -r ~/.config/fish/* .config/fish/
cp -r ~/.config/rofi .config/
cp -r ~/.config/i3 .config/
cp -r ~/.config/safeeyes .config/
cp -r ~/.config/alacritty .config/

cp -r ~/.xinitrc .xinitrc
cp -r ~/.Xmodmap .Xmodmap
cp -r ~/.inputrc .inputrc
cp -r ~/.Xresources .Xresources
