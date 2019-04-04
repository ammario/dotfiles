FROM codercom/ubuntu-dev

RUN apt-get -y install fish ripgrep
RUN chsh root -s $(which fish)

ADD .vimrc /root/
ADD .config/fish/ /root/.config/fish
