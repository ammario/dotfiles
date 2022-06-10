#!/bin/bash
if $(which apt >/dev/null); then
	sudo apt update
	sudo apt install -y neovim fish autojump dstat pg-activity stow cargo
fi

set -e

stow -t ~/.config/ .config/
stow git

# Replace 'vim' command with neovim.
if $(which vim >/dev/null); then
	sudo mv $(which vim) $(mktemp -d)
	sudo ln -s $(which nvim) /usr/bin/vim
fi

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Change default shell to fish.
sudo chsh -s $(which fish) $USER

# Install rust goodies
CARGO_NET_GIT_FETCH_WITH_CLI=true
cargo install exa bat ripgrep
