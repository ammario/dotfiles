#!/bin/bash
sudo apt-get install git vim-gnome i3 i3blocks arandr gdebi synergy keepassx tor torbrowser-launcher wget openvpn lsyncd qbittorrent

#theme stuff
sudo apt-get install lxappearance arc-theme


cd /tmp
git clone https://github.com/gsamokovarov/jump
cd jump
make
mv jump ~/bin # Or /usr/local/bin, if ~/bin isn't in $PATH.
