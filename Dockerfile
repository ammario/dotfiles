FROM codercom/ubuntu-dev

RUN sudo apt-get -y install fish ripgrep neovim htop
RUN chsh user -s $(which fish)

ADD .vimrc /root/
ADD .config/fish/ /root/.config/fish

RUN wget https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh
RUN sh installer.sh ~/.cache/dein
