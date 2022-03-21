#!/bin/bash
wget -qO- https://dl.packager.io/srv/pghero/pghero/key | sudo apt-key add -
sudo wget -O /etc/apt/sources.list.d/pghero.list \
  https://dl.packager.io/srv/pghero/pghero/master/installer/ubuntu/$(. /etc/os-release && echo $VERSION_ID).repo
sudo apt-get update
sudo apt-get -y install pghero
