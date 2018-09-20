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
cp -r ~/.config/fish/config.fish .config/fish/

cp -r ~/.xinitrc .xinitrc
cp -r ~/.Xmodmap .Xmodmap
