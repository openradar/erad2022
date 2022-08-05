#!/usr/bin/env bash
# show commands before execution
set -x

# do not fail GHA on nonzero exit status
set +e

# move into the root directory for this repo
cd $BALTRAD_INSTALL_ROOT

# download the latest installation of lrose
wget https://github.com/NCAR/lrose-core/releases/download/lrose-core-20220222/lrose-core-20220222.ubuntu_20.04.amd64.deb

# Make sure we have permission to open and run
chmod 777 lrose-core-20220222.ubuntu_20.04.amd64.deb

# Install lrose
sudo dpkg -i lrose-core-20220222.ubuntu_20.04.amd64.deb

# install using apt-get
#sudo apt-get install -y lrose-core-20190129.debian_9.amd64.deb
