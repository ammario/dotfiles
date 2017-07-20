#!/bin/bash
VERSION="go1.9beta2"
wget -P /tmp/ https://storage.googleapis.com/golang/$VERSION.linux-amd64.tar.gz 
sudo tar -C /usr/local -xzf /tmp/$VERSION.linux-amd64.tar.gz
sudo ln -s /usr/local/go/bin/go /usr/local/bin/go
