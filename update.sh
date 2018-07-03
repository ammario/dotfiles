#!/bin/bash
# Binaries and scripts
cp /usr/bin/lsws bin/

# Configs
cp ~/.gitconfig .gitconfig
cp -r ~/.fonts .
cp -r ~/.vim/colors .vim/
cp -r ~/.config/Code/User/snippets/ .config/Code/User
cp -r ~/.config/Code/User/keybindings.json .config/Code/User
cp -r ~/.config/Code/User/settings.json .config/Code/User
cp -r ~/.config/fish/config.fish .config/fish/

