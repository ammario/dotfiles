#!/bin/bash
cp -r .bashrc .fonts/ .vim/ .vimrc .inputrc ~

if [ ! -f ~/.gitconfig ]; then
	ln .gitconfig ~/.gitconfig
fi

set -e
if $(which apt > /dev/null); then
	sudo apt install -y neovim fish
fi

# Replace 'vim' command with neovim.
if $(which vim > /dev/null); then
	sudo mv $(which vim) $(mktemp -d)
	sudo ln -s $(which nvim) /usr/bin/vim	
fi

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Attach fish config
if [ ! -d ~/.config/fish ]; then
	ln -s $(pwd)/.config/fish ~/.config
fi

# Change default shell to fish.
sudo chsh -s $(which fish) $USER

