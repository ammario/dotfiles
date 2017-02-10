#!/bin/bash
cd /tmp
wget https://storage.googleapis.com/golang/go1.8rc3.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.8rc3.linux-amd64.tar.gz
sudo ln -s /usr/local/go/bin/go /usr/bin/go
cd -
