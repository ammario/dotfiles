#!/bin/bash
sudo apt-get install git vim-gnome i3 i3blocks arandr gdebi synergy keepassx tor torbrowser-launcher wget openvpn lsyncd qbittorrent thunar  p7zip-full xsel xbacklight fish compton htop lightdm pavucontrol sshfs xclip jq curl neovim rofi vlc cpulimit

# not once
sudo apt-get remove nano

sudo chsh ammar -s /usr/bin/fish

#theme stuff
sudo apt-get install lxappearance arc-theme

#use thunar as default file manager
xdg-mime default Thunar.desktop inode/directory

sudo apt-get upgrade

cd /tmp
git clone https://github.com/gsamokovarov/jump
cd jump
make
mv jump ~/bin # Or /usr/local/bin, if ~/bin isn't in $PATH.
