#!/bin/bash
VERSION="go1.9"
sudo echo "must sudo now"
curl https://storage.googleapis.com/golang/$VERSION.linux-amd64.tar.gz | sudo tar -C /usr/local -xzf -
sudo ln -s /usr/local/go/bin/go /usr/local/bin/go
