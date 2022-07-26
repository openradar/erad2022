#!/usr/bin/env bash
# show commands before execution
set -x

# do not fail GHA on nonzero exit status
set +e

# download the latest installation of lrose
wget https://github.com/NCAR/lrose-core/releases/download/lrose-core-20220222/lrose-core-20220222.ubuntu_20.04.amd64.deb

# install using apt-get
sudo apt-get install -y ./lrose-core-20190129.debian_9.amd64.deb
