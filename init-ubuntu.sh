#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

(cd $DIR/../wayfinders/tools/ubuntu && make install-core-tools install-spacemacs)

# install protonvpn
sudo apt-get install -y openvpn dialog python3-pip python3-setuptools
sudo pip3 install protonvpn-cli

# install spotify
snap install spotify
