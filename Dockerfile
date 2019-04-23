FROM codercom/ubuntu-dev

RUN sudo apt-get -y install fish ripgrep neovim htop
RUN sudo chsh user -s $(which fish)

ADD .config/fish/ /home/user/.config/fish
RUN sudo chown -R user:user ~/.config
