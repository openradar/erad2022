#!/usr/bin/env bash
set -x

# Vagrant provision script for installing BALTRAD GoogleMapsPlugin component

# dependencies
#sudo apt-get install -qq libfreetype6-dev
sudo apt-get install -qq apache2
sudo apt-get install -qq php
sudo apt-get install -qq libapache2-mod-php
sudo cp /vagrant/vendor/etc/apache2/apache2.conf /etc/apache2/apache2.conf
sudo cp /vagrant/vendor/etc/apache2/sites-enabled/000-default.conf /etc/apache2/sites-enabled/000-default.conf

# install GoogleMapsPlugin from source
cd ~/tmp
git clone --depth=1 https://github.com/baltrad/GoogleMapsPlugin.git
cd GoogleMapsPlugin/
source $CONDA_DIR/bin/activate $RADARENV
python setup.py install --prefix=$CONDA_PREFIX
# Replace Google Maps with OpenStreetMap
cp web/index.html $CONDA_PREFIX/rave_gmap/web/.
rm $CONDA_PREFIX/rave_gmap/web/index.php

# HACK the setup.py files need to add the line
# import distutils.sysconfig
# The .pth file is not copied because of this, manually create the file
echo $CONDA_PREFIX/rave_gmap/Lib/ > $CONDA_PREFIX/lib/python3.6/site-packages/rave_gmap.pth

# Add an amazing case!
cp /vagrant/vendor/opt/baltrad/rave_gmap/web/smhi-areas.xml $CONDA_PREFIX/rave_gmap/web/.
cp /vagrant/vendor/opt/baltrad/rave_gmap/web/products.js $CONDA_PREFIX/rave_gmap/web/.
mkdir $CONDA_PREFIX/rave_gmap/web/data
cp /vagrant/vendor/opt/baltrad/rave_gmap/web/data/cawkr_gmaps.tgz $CONDA_PREFIX/rave_gmap/web/data/.
cd $CONDA_PREFIX/rave_gmap/web/data
tar xzf cawkr_gmaps.tgz
rm cawkr_gmaps.tgz

# Restart apache2 with the plugin contents
sudo service apache2 restart
